//Clean Memory DLL
//Halo Shg
//
//mem = cleanmem_get_mem();
//
//Retorna a memória em bytes.
if(os_type == os_win32 || os_type == os_windows){
    return(external_call(global._cleanmem_get_mem));
};
