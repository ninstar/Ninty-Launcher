///szip_extract(file, extraction_path, password[0=Noone])

//Find password
var _zip_password;
if(argument2 != 0)
    _zip_password = '-p'+string(argument2)+' -mhe ';
else
    _zip_password = '';

//Export .Bat
var _zip_batch = file_text_open_write(game_save_id+"szip_unzip.bat");
file_text_write_string(_zip_batch,'cd "'+string(working_directory)+'"');
file_text_writeln(_zip_batch);
file_text_write_string(_zip_batch,'7za.exe x "'+string(argument0)+'" -o"'+string(argument1)+'" -aoa '+string(_zip_password)+'-y'); //<[COMANDO]
file_text_close(_zip_batch);

//Execute .Bat and excract .ZIP
var _zip_hidden;
if(global.debug == 1)
    _zip_hidden = 0;
else
    _zip_hidden = 1;
executeshell('"'+game_save_id+'szip_unzip.bat"',1,_zip_hidden);
file_delete_fmns(game_save_id+"szip_unzip.bat");
