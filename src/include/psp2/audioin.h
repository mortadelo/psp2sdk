/**
 * \file
 * \brief Header file which defines control related variables and functions
 *
 * Copyright (C) 2015 PSP2SDK Project
 *
 * This library is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef _PSP2_AUDIOIN_H_
#define _PSP2_AUDIOIN_H_

enum {
	//! Undefined error
	SCE_AUDIO_IN_ERROR_FATAL	= 0x80260100,

	//! Bad value of port number
	SCE_AUDIO_IN_ERROR_INVALID_PORT	= 0x80260101,

	//! Invalid sample length
	SCE_AUDIO_IN_ERROR_INVALID_SIZE	= 0x80260102,

	//! Invalid sample frequency
	SCE_AUDIO_IN_ERROR_INVALID_SAMPLE_FREQ	= 0x80260103,

	//! Invalid port type
	SCE_AUDIO_IN_ERROR_INVALID_PORT_TYPE	= 0x80260104,

	//! Invalid pointer value
	SCE_AUDIO_IN_ERROR_INVALID_POINTER	= 0x80260105,

	//! Invalid port param
	SCE_AUDIO_IN_ERROR_INVALID_PORT_PARAM	= 0x80260106,

	//! Cannot open no ports
	SCE_AUDIO_IN_ERROR_PORT_FULL	= 0x80260107,

	//! Not enough memory
	SCE_AUDIO_IN_ERROR_OUT_OF_MEMORY	= 0x80260108,

	//! Port is not opened
	SCE_AUDIO_IN_ERROR_NOT_OPENED	= 0x80260109,

	//! Tried to input while busy
	SCE_AUDIO_IN_ERROR_BUSY	= 0x8026010A
};

enum {
	PSP2_AUDIO_IN_PORT_TYPE_VOICE	= 0,
	PSP2_AUDIO_IN_PORT_TYPE_RAW	= 0x0002
};

enum {
	PSP2_AUDIO_IN_PARAM_FORMAT_S16_MONO	= 0,
	PSP2_AUDIO_IN_GETSTATUS_MUTE	= 1
};

//! Open port
int sceAudioInOpenPort(int portType, int grain, int freq, int param);

//! Close port
int sceAudioInReleasePort(int port);

int sceAudioInInput(int port, void *destPtr);

/* get status */
int sceAudioInGetAdopt(int portType);
int sceAudioInGetStatus(int select);

#endif
