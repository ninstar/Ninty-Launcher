// string temp_directory_fmns()
    
if (os_type == os_windows)
{
    var filemng_result = external_call(external_define(assets_dir+"filemng.dll", "temp_directory", dll_cdecl, ty_string, 0));
    external_free(assets_dir+"filemng.dll");
    return filemng_result;
}

if (os_type == os_macosx)
{
    var filemng_result = external_call(external_define(assets_dir+"filemng.dylib", "temp_directory", dll_cdecl, ty_string, 0));
    external_free(assets_dir+"filemng.dylib");
    return filemng_result;
}
       
if (os_type == os_linux)
{
    var filemng_result = external_call(external_define(assets_dir+"filemng.so", "temp_directory", dll_cdecl, ty_string, 0));
    external_free(assets_dir+"filemng.so");
    return filemng_result;
}
