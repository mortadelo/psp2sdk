@ Copyright (C) 2015 PSP2SDK Project
@
@ This library is free software: you can redistribute it and/or modify
@ it under the terms of the GNU Lesser General Public License as published by
@ the Free Software Foundation, either version 3 of the License, or
@ (at your option) any later version.
@
@ This libary is distributed in the hope that it will be useful,
@ but WITHOUT ANY WARRANTY; without even the implied warranty of
@ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
@ GNU Lesser General Public License for more details.
@
@ You should have received a copy of the GNU Lesser General Public License
@ along with this program.  If not, see <http://www.gnu.org/licenses/>.

#include <psp2/import.S>

PSP2_IMPORT_HEAD 0x0, SceHttp, 0001, 1, 0

PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x00659635, sceHttpsDisableOptionPrivate
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x03a6c89e, sceHttpParseResponseHeader
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x07d9f8bb, sceHttpDestroyEpoll
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x0daca8d4, sceHttpCookieFlush
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x0f1fd1b3, sceHttpSetEpoll
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x11c03867, sceHttpSetCookieSendCallback
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x11ec42d0, sceHttpSetAuthEnabled
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x11f6c27f, sceHttpGetAllResponseHeaders
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x1274d318, sceHttpUriUnescape
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x179c56db, sceHttpParseStatusLine
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x1b6ef66e, sceHttpGetCookieEnabled
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x1d45f24e, sceHttpUriParse
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x1da2a673, sceHttpUriEscape
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x1ea3bb9c, sceHttpSetDefaultAcceptEncodingGZIPEnabled
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x214926d9, sceHttpInit
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x237ca86e, sceHttpSetConnectTimeOut
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x23978cbc, sceHttpSetIcmOption
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x27071691, sceHttpGetStatusCode
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x27a98bda, sceHttpSetNonblock
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x2b79bde0, sceHttpsGetSslError
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x2d3f1281, sceHttpSslIsCtxCreated
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x31c00fba, sceHttpAddRequestHeaderRaw
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x34891c3f, sceHttpSetAutoRedirect
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x37c30c90, sceHttpSetRequestContentLength
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x3d3d29ad, sceHttpDeleteRequest
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x3d44a6e5, sceHttpAbortRequestForce
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x4259fb9e, sceHttpCookieExport
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x42e7dff1, sceHttpAbortWaitRequest
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x47664424, sceHttpUriBuild
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x48650a83, sceHttpWaitRequestCB
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x4e08167d, sceHttpSetRedirectCallback
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x50737a3f, sceHttpUriSweepPath
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x56c95d94, sceHttpsFreeCaList
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x5c4080bc, sceHttpSetCookieTotalMaxSize
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x5ceb6554, sceHttpSetEpollId
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x5daa4def, sceHttpSetCookieMaxNum
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x5eb5f548, sceHttpRemoveRequestHeader
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x61a4adde, sceHttpGetIcmOption
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x62241dab, sceHttpCreateTemplate
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x635f961f, sceHttpSetCookieMaxNumPerDomain
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x65fe983f, sceHttpGetEpoll
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x6727874c, sceHttpGetAuthEnabled
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x6ead73eb, sceHttpGetAutoRedirect
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x70220bfa, sceHttpGetCookie
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x7295c704, sceHttpSetAcceptEncodingGZIPEnabled
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x72cb0741, sceHttpsEnableOptionPrivate
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x75027d1d, sceHttpUriMerge
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x7b51b122, sceHttpAddRequestHeader
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x7c99af67, sceHttpCreateEpoll
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x7ede3979, sceHttpReadData
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x8455b5b3, sceHttpSetResolveTimeOut
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x8577833f, sceHttpsUnloadCert
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x8ae3f008, sceHttpSetSendTimeOut
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x8bab3971, sceHttpRedirectCacheFlush
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x8ef6af55, sceHttpGetCookieStats
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x94bf196e, sceHttpSetRecvTimeOut
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x94f7256a, sceHttpWaitRequest
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x9a68c3de, sceHttpGetLastErrno
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x9ab56ea7, sceHttpSetResolveRetry
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x9ca58b99, sceHttpSendRequest
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x9df48282, sceHttpCookieImport
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x9e031d7c, sceHttpGetEpollId
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0x9fbe2869, sceHttpsEnableOption
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0xa0926037, sceHttpsSetSslCallback
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0xae8d7c33, sceHttpsLoadCert
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0xaeb3307e, sceHttpCreateConnection
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0xaee573a3, sceHttpSetCookieEnabled
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0xaf03924c, sceHttpAuthCacheFlush
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0xb0284270, sceHttpCreateRequest
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0xbaa34d18, sceHttpRequestGetAllHeaders
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0xbbfa3c2a, sceHttpGetAcceptEncodingGZIPEnabled
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0xbd5da1d0, sceHttpCreateRequestWithURL
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0xbedb988d, sceHttpAddCookie
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0xc616c200, sceHttpCreateConnectionWithURL
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0xc6d60403, sceHttpsDisableOption
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0xc9076666, sceHttpTerm
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0xcfb1da4b, sceHttpUnsetEpoll
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0xd4f32a23, sceHttpSetCookieRecvCallback
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0xd65746bc, sceHttpGetNonblock
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0xe0a3a88d, sceHttpSetAuthInfoCallback
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0xe9c083a5, sceHttpSetCookieMaxSize
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0xea61662f, sceHttpAbortRequest
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0xec85ecfb, sceHttpDeleteTemplate
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0xf0f65c15, sceHttpDeleteConnection
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0xf580d304, sceHttpGetResponseContentLength
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0xf71aa58d, sceHttpsGetCaList
PSP2_IMPORT_FUNC SceHttp, 0001, F00, 0xf98cdfa9, sceHttpGetMemoryPoolStats
