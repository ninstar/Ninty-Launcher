//Clean Memory DLL
//Halo Shg
//
//result = cleanmem();
//
//Retornar 0 (false) caso falhe
if(os_type == os_win32 || os_type == os_windows){
    return(external_call(global._cleanmem));
};
