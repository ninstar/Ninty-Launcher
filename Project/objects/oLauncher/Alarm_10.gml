/// @description Organizar arquivos
if(move_rest < games_total-1){

    //Mover...
    games_title[move_rest] = games_title[move_rest+1];
    games_path[move_rest] = games_path[move_rest+1];
    games_forwarder[move_rest] = games_forwarder[move_rest+1];
    games_subselect[move_rest] = games_subselect[move_rest+1];
    games_shortcut[move_rest] = games_shortcut[move_rest+1];
    games_animframes[move_rest] = games_animframes[move_rest+1];
    games_animspeed[move_rest] = games_animspeed[move_rest+1];
    games_playtime[move_rest,0] = games_playtime[move_rest+1,0];
    games_playtime[move_rest,1] = games_playtime[move_rest+1,1];
    
    sprite_delete(games_thumb[move_rest]);
    games_thumb[move_rest] = sprite_duplicate(games_thumb[move_rest+1]);
    file_rename(game_save_id+"collection\\game_"+string(move_rest+1)+".png",game_save_id+"collection\\game_"+string(move_rest)+".png");
    file_rename(game_save_id+"collection\\game_"+string(move_rest+1)+".ini",game_save_id+"collection\\game_"+string(move_rest)+".ini");

    //Ir para próximo arquivo...
    move_rest++;
    alarm[10] = 5;
}
else{

    //Decrementar
    audio_stop_sound(snd_loading);
    audio_play_sfx(snd_alert);
    games_total--;

    //Salvar total de jogos
    ini_open(game_save_id+"collection\\_total.ini");
    ini_write_string("NINTY_ENTRY","total",string(games_total));
    ini_close();

    //Checar arquivo
    if(file_exists(games_path[select_index])) select_exists = 1;
    else select_exists = 0;

    //Atualizar RPC
    event_user(0);
    
    alarm[10] = -1;
}

