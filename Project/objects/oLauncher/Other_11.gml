/// @description Carregar assets (Jogos, Thumbnails e Wallpaper)
/// @param Jogos
/// @param  Thumbnails e Wallpaper

// WALLPAPER ----------------------------------------------

if(launched == 0){

    //Configuração do Wallpaper
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
    
    //Música (primeiro carregamento)
    wallpaper_song = audio_create_stream(global.assets_dir+"dummy.aud");
}

//Wallpaper
if(file_exists(game_save_id+"wallpaper.png"))
    wallpaper = sprite_add(game_save_id+"wallpaper.png",wallpaper_animframes,0,0,0,0);
else
    wallpaper = noone;

//Música
instance_create(0,0,oAudioPlayer);
            
//Animador (Wallpaper)
anim_wallpaper = 0;

// JOGOS ----------------------------------------------

//Buscar total de jogos
if(launched == 0){

    games_total = 0;
    ini_open(game_save_id+"collection\\_total.ini");
    games_total = real(ini_read_string("NINTY_ENTRY","total","0"));
    ini_close();
}

//Lista
var i;
for(i=0; i<games_total+1; i+=1){

    //Dados
    if(launched == 0){
    
        ini_open(game_save_id+"collection\\game_"+string(i)+".ini");
        games_title[i] = ini_read_string("NINTY_ENTRY","title","???");
        games_path[i] = ini_read_string("NINTY_ENTRY","path","");
        games_forwarder[i] = ini_read_string("NINTY_ENTRY","forwarder","");
        games_subselect[i] = real(ini_read_string("NINTY_ENTRY","subselect","1"));
        games_shortcut[i] = real(ini_read_string("NINTY_ENTRY","shortcut","0"));
        games_animframes[i] = real(ini_read_string("NINTY_ENTRY","animframes","1"));
        games_animspeed[i] = real(ini_read_string("NINTY_ENTRY","animspeed","0"));
        var _h = base64_decode(ini_read_string("NINTY_ENTRY","0","0"));
        var _m = base64_decode(ini_read_string("NINTY_ENTRY","1","0"));
        ini_close();
		
        if(_h != "") games_playtime[i,0] = real(_h);
        if(_m != "") games_playtime[i,1] = real(_m);
    }
    
    //Importar thumbnail
    if(file_exists(game_save_id+"collection\\game_"+string(i)+".png"))
        games_thumb[i] = sprite_add(game_save_id+"collection\\game_"+string(i)+".png",games_animframes[i],0,1,0,0);
    else
        games_thumb[i] = sprite_add(global.assets_dir+"default.tbn",0,0,0,0,0);
        
    //Animador
    anim_games[i] = 0;
}

//Checar arquivo selecionado
if(games_total >= select_index){

    if(file_exists(games_path[select_index]))
        select_exists = 1;
    else
        select_exists = 0;
}
else
    select_exists = 0;
    
//Próxima vez que carregar, apenas o básico
if(launched == 0)
    launched = 1;

