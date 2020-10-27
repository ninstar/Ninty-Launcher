/// @description Carregar música
if(file_exists(game_save_id+"wallpaper.ogg"))
    oLauncher.wallpaper_song = audio_create_stream(game_save_id+"wallpaper.ogg");
else
    oLauncher.wallpaper_song = audio_create_stream(global.assets_dir+"dummy.aud");
    
//Tocar
alarm[1] = 15;

