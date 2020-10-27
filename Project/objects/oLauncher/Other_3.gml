/// @description Salvar

//Salvar configurações do launcher
event_user(4);

//Salvar configuração do Wallpaper
if!(file_exists(game_save_id+"wallpaper.ini")){

    ini_open(game_save_id+"wallpaper.ini")
    ini_write_string("NINTY_WALLPAPER","theme",string(theme));
    ini_write_string("NINTY_WALLPAPER","opaquebuttons",string(wallpaper_opaquebuttons));
    ini_write_string("NINTY_WALLPAPER","tiled",string(wallpaper_tiled));
    ini_write_string("NINTY_WALLPAPER","stretched",string(wallpaper_stretched));
    ini_write_string("NINTY_WALLPAPER","smooth",string(wallpaper_smooth));
    ini_write_string("NINTY_WALLPAPER","huecolor",string(wallpaper_huecolor));
    ini_write_string("NINTY_WALLPAPER","cursor_hue",string(wallpaper_huecursor));
    ini_write_string("NINTY_WALLPAPER","cursor_saturationA",string(wallpaper_sat1cursor));
    ini_write_string("NINTY_WALLPAPER","cursor_saturationB",string(wallpaper_sat2cursor));
    ini_write_string("NINTY_WALLPAPER","cursor_luminosityA",string(wallpaper_lum1cursor));
    ini_write_string("NINTY_WALLPAPER","cursor_luminosityB",string(wallpaper_lum2cursor));    
    ini_write_string("NINTY_WALLPAPER","horizontal_offset",string(wallpaper_h_offset));
    ini_write_string("NINTY_WALLPAPER","vertical_offset",string(wallpaper_v_offset));
    ini_write_string("NINTY_WALLPAPER","horizontal_scrolling",string(wallpaper_h_scrolling));
    ini_write_string("NINTY_WALLPAPER","vertical_scrolling",string(wallpaper_v_scrolling));
    ini_write_string("NINTY_WALLPAPER","animframes",string(wallpaper_animframes));
    ini_write_string("NINTY_WALLPAPER","animspeed",string(wallpaper_animspeed));
    ini_close();
}

//Deletar .BAT
file_delete(game_save_id+"\\gameboot.bat");

//Descarregar assets
event_user(2);

//Descarregar DLLs
if(nativerpc == 1)
    FreeDiscord();

audio_group_unload(sound_effects);

