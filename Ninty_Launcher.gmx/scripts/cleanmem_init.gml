//Clean Memory DLL
//Halo Shg
//
//cleanmem_init( [free-switch] );
//If argument0 = 1, the dll will free the dll, as opposed to init it.
//call cleanmem_init(1); at the end of the game.
if(os_type == os_win32 || os_type == os_windows)
{
    var cm_dll;
    cm_dll = assets_dir+"memctrl.dll"; //Incase you have it under a different directory
    if (argument0)
    {
        external_free(cm_dll);
        exit;
    }
    global._cleanmem = external_define(cm_dll,"halo_shg_clean",dll_cdecl,ty_real,0);
    global._cleanmem_get_mem = external_define(cm_dll,"halo_shg_get_mem",dll_cdecl,ty_real,0);
};
return 0;
