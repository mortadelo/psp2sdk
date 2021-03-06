/*
 * Copyright (C) 2015 PSP2SDK Project
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#include <openssl/sha.h>
#include <errno.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include "elf_psp2.h"
#include "elf.h"
#include "info.h"
#include "rel.h"
#include "scn.h"
#include "seg.h"

int findSyslib(syslib_t *syslib, FILE *fp, scn_t *scns, Elf32_Half shnum,
	const seg_t *segs, const seg_t *rela,
	const char *strtab, const Elf32_Sym *symtab,
	scn_t *ent, const scn_t *relEnt)
{
	const Elf32_Rel *rel;
	const Elf32_Sym *sym;
	const Elf32_Word *nids;
	Elf32_Word i, stubOffset, *p;
	const scn_t *stubRel;
	scn_t *scn;
	int res;

	if (syslib == NULL || fp == NULL || scns == NULL || segs == NULL
		|| rela == NULL || strtab == NULL || symtab == NULL
		|| ent == NULL || relEnt == NULL || relEnt->content == NULL)
	{
		return EINVAL;
	}

	if (ent->content == NULL) {
		res = loadScn(fp, ent, strtab + ent->shdr.sh_name);
		if (res)
			return res;
	}

	// Stub Table
	rel = findRelByOffset(relEnt, ent->segOffset + 28, strtab);
	if (rel == NULL)
		return errno;

	sym = symtab + ELF32_R_SYM(rel->r_info);
	scn = scns + sym->st_shndx;
	stubOffset = sym->st_value - segs[scn->phndx].phdr.p_vaddr;

	i = 0;
	do {
		if (i >= rela->shnum) {
			fprintf(stderr, "%s: Relocation table not found\n",
				strtab + scn->shdr.sh_name);
			return EILSEQ;
		}

		stubRel = rela->scns[i];
		i++;
	} while (stubRel->shdr.sh_info != sym->st_shndx);

	// NID Table
	rel = findRelByOffset(relEnt, ent->segOffset + 24, strtab);
	if (rel == NULL)
		return errno;

	sym = symtab + ELF32_R_SYM(rel->r_info);
	scn = scns + sym->st_shndx;

	if (scn->content == NULL) {
		res = loadScn(fp, scn, strtab + scn->shdr.sh_name);
		if (res)
			return res;
	}

	nids = (void *)((uintptr_t)scn->content
		+ sym->st_value - scn->shdr.sh_addr);

	// Resolve
	for (i = 0; i < ((Elf32_Half *)ent->content)[3]; i++) {
		if (nids[i] == 0x935CD196)
			p = &syslib->start;
		else if (nids[i] == 0x79F8E492)
			p = &syslib->stop;
		else
			continue;

		rel = findRelByOffset(stubRel, stubOffset + i * 4, strtab);
		if (rel == NULL)
			return errno;

		*p = symtab[ELF32_R_SYM(rel->r_info)].st_value;
	}

	return 0;
}

int updateModinfo(FILE *fp, const scn_t *scns, Elf32_Half shnum,
	const sceScns_t *sceScns, Elf32_Addr base,
	const syslib_t *syslib, const char *strtab, const char *str)
{
	unsigned char md[SHA_DIGEST_LENGTH];
	_sceModuleInfo *info;
	const scn_t *sp;
	int res;

	if (fp == NULL || scns == NULL || sceScns == NULL
		|| sceScns->relEnt->content == NULL || strtab == NULL || str == NULL)
	{
		return EINVAL;
	}

	if (sceScns->modinfo->orgSize != sizeof(_sceModuleInfo))
		return EILSEQ;

	res = loadScn(fp, sceScns->modinfo, str);
	if (res)
		return res;

	info = sceScns->modinfo->content;

	info->expTop = sceScns->ent->shdr.sh_addr - base;
	info->expBtm = info->expTop + sceScns->ent->shdr.sh_size;

	info->impTop = sceScns->stub->shdr.sh_addr - base;
	info->impBtm = info->impTop + sceScns->stub->shdr.sh_size;


	info->start = syslib->start - base;
	info->stop = syslib->stop - base;

	sp = findScnByType(scns, shnum, SHT_ARM_EXIDX, NULL);
	if (sp != NULL) {
		info->exidxTop = sp->segOffset;
		info->exidxBtm = info->exidxTop + sp->shdr.sh_size;
	}

	sp = findScnByName(scns, shnum, strtab, ".ARM.extab", NULL);
	if (sp != NULL) {
		info->extabTop = sp->segOffset;
		info->extabBtm = info->extabTop + sp->shdr.sh_size;
	}

	if (info->nid == 0) {
		SHA1((unsigned char *)info->name, strlen(info->name), md);
		((unsigned char *)&info->nid)[0] = md[3];
		((unsigned char *)&info->nid)[1] = md[2];
		((unsigned char *)&info->nid)[2] = md[1];
		((unsigned char *)&info->nid)[3] = md[0];
	}

	return 0;
}