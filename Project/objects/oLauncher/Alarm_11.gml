/// @description Mover arquivos

//Mover destino para origem...
if(file_exists(game_save_id+"collection\\game_"+string(select_index)+".ini")){

    //Mover...
    games_title[move_origin] = games_title[select_index];
    games_path[move_origin] = games_path[select_index];
    games_forwarder[move_origin] = games_forwarder[select_index];
    games_subselect[move_origin] = games_subselect[select_index];
    games_shortcut[move_origin] = games_shortcut[select_index];
    games_animframes[move_origin] = games_animframes[select_index];
    games_animspeed[move_origin] = games_animspeed[select_index];
    games_playtime[move_origin,0] = games_playtime[select_index,0];
    games_playtime[move_origin,1] = games_playtime[select_index,1];
    games_thumb[move_origin] = sprite_duplicate(games_thumb[select_index]);
    
    //Deletar sprite de destino
    sprite_delete(games_thumb[select_index]);
    
    //Renomear
    file_rename(game_save_id+"collection\\game_"+string(select_index)+".png",game_save_id+"collection\\game_"+string(move_origin)+".png");
    file_rename(game_save_id+"collection\\game_"+string(select_index)+".ini",game_save_id+"collection\\game_"+string(move_origin)+".ini");

    //Ir para próximo arquivo...
    alarm[11] = 5;
}
//Mover origem (que estava em TMP) para destino...
else{

    //Carregar novos...
    games_title[select_index] = move_temp_title;
    games_path[select_index] = move_temp_path;
    games_forwarder[select_index] = move_temp_forwarder;
    games_subselect[select_index] = move_temp_subselect;
    games_shortcut[select_index] = move_temp_shortcut;
    games_animframes[select_index] = move_temp_animframes;
    games_animspeed[select_index] = move_temp_animspeed;
    games_playtime[select_index,0] = move_temp_playtime[0];
    games_playtime[select_index,1] = move_temp_playtime[1];
    sprite_delete(games_thumb[select_index]);
    games_thumb[select_index] = sprite_duplicate(move_temp_thumbnail);
    
    //Corrigir nome
    ini_open(game_save_id+"collection\\game_"+string(move_origin)+".ini")
    games_title[move_origin] = ini_read_string("NINTY_ENTRY","title","???");
    ini_close();
    
    //Deletar sprite de origem
    sprite_delete(move_temp_thumbnail);
    
    //Renomear
    file_rename(game_save_id+"collection\\game_TMP.png",game_save_id+"collection\\game_"+string(select_index)+".png");
    file_rename(game_save_id+"collection\\game_TMP.ini",game_save_id+"collection\\game_"+string(select_index)+".ini");

    //Checar arquivo
    if(file_exists(games_path[select_index])) select_exists = 1;
    else select_exists = 0;

    //SFX
    audio_play_sfx(snd_move_set);
    
    //Finalizar
    move = 0;
    move_origin = -1;
    alarm[11] = -1;
}

