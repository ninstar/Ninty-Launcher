// real file_delete_fmns(string fname)
    
if (os_type == os_windows)
{
    var filemng_result = external_call(external_define("filemng.dll", "file_delete", dll_cdecl, ty_real, 1, ty_string), argument0);
    external_free("filemng.dll");
    return filemng_result;
}

if (os_type == os_macosx)
{
    var filemng_result = external_call(external_define("filemng.dylib", "file_delete", dll_cdecl, ty_real, 1, ty_string), argument0);
    external_free("filemng.dylib");
    return filemng_result;
}
       
if (os_type == os_linux)
{
    var filemng_result = external_call(external_define("filemng.so", "file_delete", dll_cdecl, ty_real, 1, ty_string), argument0);
    external_free("filemng.so");
    return filemng_result;
}
