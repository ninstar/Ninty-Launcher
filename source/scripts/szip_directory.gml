///szip_directory(input_path, output_path, compression[1...9], password[0=Noone]);

//Includes password
var _zip_password;
if(argument3 != 0)
    _zip_password = '-p'+string(argument3)+' -mhe ';
else
    _zip_password = '';

//Export .Bat
var _zip_batch = file_text_open_write(game_save_id+"szip_directory.bat");
file_text_write_string(_zip_batch,'cd "'+string(working_directory)+'"');
file_text_writeln(_zip_batch);
file_text_write_string(_zip_batch,'7za.exe a "'+string(argument1)+'" "'+string(argument0)+'" -mx'+string(argument2)+' '+string(_zip_password)+'-y'); //<[COMANDO]
file_text_close(_zip_batch);

//Execute .Bat and create .ZIP
var _zip_hidden;
if(global.debug == 1)
    _zip_hidden = 0;
else
    _zip_hidden = 1;
executeshell('"'+game_save_id+'szip_directory.bat"',1,_zip_hidden);
file_delete_fmns(game_save_id+"szip_directory.bat");
