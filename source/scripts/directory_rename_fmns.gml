// real directory_rename_fmns(string oldname, string newname)
    
if (os_type == os_windows)
{
    var filemng_result = external_call(external_define(global.assets_dir+"filemng.dll", "directory_rename", dll_cdecl, ty_real, 2, ty_string, ty_string), argument0, argument1);
    external_free(global.assets_dir+"filemng.dll");
    return filemng_result;
}

if (os_type == os_macosx)
{
    var filemng_result = external_call(external_define(global.assets_dir+"filemng.dylib", "directory_rename", dll_cdecl, ty_real, 2, ty_string, ty_string), argument0, argument1);
    external_free(global.assets_dir+"filemng.dylib");
    return filemng_result;
}
       
if (os_type == os_linux)
{
    var filemng_result = external_call(external_define(global.assets_dir+"filemng.so", "directory_rename", dll_cdecl, ty_real, 2, ty_string, ty_string), argument0, argument1);
    external_free(global.assets_dir+"filemng.so");
    return filemng_result;
}
