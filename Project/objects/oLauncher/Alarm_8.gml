/// @description Wallpaper
var wpp = get_open_filename(".PNG/.JPG (1280x720)|*.png;*.jpg","");

//Definir sem animação previamente
wallpaper_animframes = 0;
wp_x = 0;
wp_y = 0;
    
//Deletar wallpaper do launcher
if(sprite_exists(wallpaper))
    sprite_delete(wallpaper);

//Parar música
audio_stop_sound(wallpaper_song);
audio_destroy_stream(wallpaper_song);

//Deletar arquivo antigo
file_delete(game_save_id+"wallpaper.png");
file_delete(game_save_id+"wallpaper.ini");
file_delete(game_save_id+"wallpaper.ogg");
    
//Copiar...

//Configurações
file_copy(string_copy(wpp,1,string_length(wpp)-4)+".ini",game_save_id+"wallpaper.ini");

//Música
file_copy(string_copy(wpp,1,string_length(wpp)-4)+".ogg",game_save_id+"wallpaper.ogg");

//Carregar configuração do Wallpaper
ini_open(game_save_id+"wallpaper.ini");
theme = real(ini_read_string("NINTY_WALLPAPER","theme","1"));
wallpaper_opaquebuttons = real(ini_read_string("NINTY_WALLPAPER","opaquebuttons","0"));
wallpaper_tiled = real(ini_read_string("NINTY_WALLPAPER","tiled","1"));
wallpaper_stretched = real(ini_read_string("NINTY_WALLPAPER","stretched","0"));
wallpaper_smooth = real(ini_read_string("NINTY_WALLPAPER","smooth","1"));
wallpaper_huecolor = real(ini_read_string("NINTY_WALLPAPER","huecolor","0"));
wallpaper_huecursor = real(ini_read_string("NINTY_WALLPAPER","cursor_hue","0"));
wallpaper_sat1cursor = real(ini_read_string("NINTY_WALLPAPER","cursor_saturationA","255"));
wallpaper_sat2cursor = real(ini_read_string("NINTY_WALLPAPER","cursor_saturationB","255"));
wallpaper_lum1cursor = real(ini_read_string("NINTY_WALLPAPER","cursor_luminosityA","255"));
wallpaper_lum2cursor = real(ini_read_string("NINTY_WALLPAPER","cursor_luminosityB","64"));
wallpaper_h_offset = real(ini_read_string("NINTY_WALLPAPER","horizontal_offset","0"));
wallpaper_v_offset = real(ini_read_string("NINTY_WALLPAPER","vertical_offset","0"));
wallpaper_h_scrolling = real(ini_read_string("NINTY_WALLPAPER","horizontal_scrolling","0"));
wallpaper_v_scrolling = real(ini_read_string("NINTY_WALLPAPER","vertical_scrolling","0"));
wallpaper_animframes = real(ini_read_string("NINTY_WALLPAPER","animframes","1"));
wallpaper_animspeed = real(ini_read_string("NINTY_WALLPAPER","animspeed","0"));
ini_close();

if(wpp != ""){

    //Trocar wallpaper
    wallpaper = sprite_add(wpp,wallpaper_animframes,0,wallpaper_smooth,0,0);
    file_copy(wpp,game_save_id+"wallpaper.png");
        
    //SFX
    audio_play_sfx(snd_addgame_step3);
}
//SFX
else
    audio_play_sfx(snd_alert);

//Trocar música e tocar
instance_create(0,0,oAudioPlayer);
    
//Limpar inputs
io_clear();
delay = 5;
    
//Voltar fullscreen... (Se tiver sido definido antes)    
window_set_fullscreen(fullscreen);

