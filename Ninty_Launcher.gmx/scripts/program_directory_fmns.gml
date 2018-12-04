// string program_directory_fmns()
    
if (os_type == os_windows)
{
    var filemng_result = external_call(external_define("filemng.dll", "program_directory", dll_cdecl, ty_string, 0));
    external_free("filemng.dll");
    return filemng_result;
}

if (os_type == os_macosx)
{
    var filemng_result = external_call(external_define("filemng.dylib", "program_directory", dll_cdecl, ty_string, 0));
    external_free("filemng.dylib");
    return filemng_result;
}
       
if (os_type == os_linux)
{
    var filemng_result = external_call(external_define("filemng.so", "program_directory", dll_cdecl, ty_string, 0));
    external_free("filemng.so");
    return filemng_result;
}
