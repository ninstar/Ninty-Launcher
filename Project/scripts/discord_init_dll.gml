/*

Call this script to init the dll files.

Note : This only inits the files , not the rich presence.

Arguments : 
- Noone

Returns:
- Void

-----------------------------------------

Discord Rich Presence for Game Maker made by Aouab

*/

dll = global.assets_dir+"discrpc.dll";

global.__d_init = external_define(dll,"InitDiscord",dll_cdecl,ty_real,1,ty_string)
global.__d_update = external_define(dll,"UpdatePresence",dll_cdecl,ty_real,4,ty_string,ty_string,ty_string,ty_string)
global.__d_free = external_define(dll,"FreeDiscord",dll_cdecl,ty_real,0)

