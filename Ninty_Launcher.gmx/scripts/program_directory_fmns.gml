// string program_directory_fmns()
    
if (os_type == os_windows)
{
    var filemng_result = external_call(external_define(global.assets_dir+"filemng.dll", "program_directory", dll_cdecl, ty_string, 0));
    external_free(global.assets_dir+"filemng.dll");
    return filemng_result;
}

if (os_type == os_macosx)
{
    var filemng_result = external_call(external_define(global.assets_dir+"filemng.dylib", "program_directory", dll_cdecl, ty_string, 0));
    external_free(global.assets_dir+"filemng.dylib");
    return filemng_result;
}
       
if (os_type == os_linux)
{
    var filemng_result = external_call(external_define(global.assets_dir+"filemng.so", "program_directory", dll_cdecl, ty_string, 0));
    external_free(global.assets_dir+"filemng.so");
    return filemng_result;
}
