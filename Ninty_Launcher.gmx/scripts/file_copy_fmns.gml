// real file_copy_fmns(string fname, string newname)

if (os_type == os_windows)
{
    var filemng_result = external_call(external_define("filemng.dll", "file_copy", dll_cdecl, ty_real, 2, ty_string, ty_string), argument0, argument1);
    external_free("filemng.dll");
    return filemng_result;
}

if (os_type == os_macosx)
{
    var filemng_result = external_call(external_define("filemng.dylib", "file_copy", dll_cdecl, ty_real, 2, ty_string, ty_string), argument0, argument1);
    external_free("filemng.dylib");
    return filemng_result;
}
       
if (os_type == os_linux)
{
    var filemng_result = external_call(external_define("filemng.so", "file_copy", dll_cdecl, ty_real, 2, ty_string, ty_string), argument0, argument1);
    external_free("filemng.so");
    return filemng_result;
}
