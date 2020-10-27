with (other) {
global.assets_dir = working_directory;
downloading = 0;
async_redirect = noone;
async_appdb = noone;

// Base de dados
global.DatabaseURL = "";
var _URL_Path = global.assets_dir+"database.cfg";
if(file_exists(_URL_Path)){

    var _URL_File = file_text_open_read(_URL_Path);
    global.DatabaseURL = file_text_read_string(_URL_File);
    file_text_close(_URL_File);
}

//Redirecionamente dinamico
ini_open(game_save_id+"network\\NETWORK.cfg");
global.redirect_about = ini_read_string("URL","page","hpps://");
global.redirect_appdb = ini_read_string("REDIRECT","appdb","hpps://");
ini_close();

//Override
ini_open(global.assets_dir+"NETWORK.cfg");
if(ini_key_exists("REDIRECT","appdb"))  global.redirect_appdb = ini_read_string("REDIRECT","appdb","hpps://");
ini_close();

//Buscar por "NETWORK.cfg" mais recente
if(os_is_network_connected()){

    async_redirect = http_get_file(global.DatabaseURL,game_save_id+"network\\NETWORK.cfg");
    downloading = 1;
}

}
