/// @description Remover jogo

//Deletar sprite
sprite_delete(games_thumb[select_index]);
            
//Nulo
games_title[select_index] = text_deleting;
games_playtime[select_index,0] = "0";
games_playtime[select_index,1] = "0";
      
//Deletar arquivos
file_delete(game_save_id+"collection\\game_"+string(select_index)+".png");
file_delete(game_save_id+"collection\\game_"+string(select_index)+".ini");
                          
//Deletar ultimo (sendo o ultimo selecionado)
if(select_index == games_total-1)
&&(select_index > 0){
    
    //Apagar apenas esse
    games_path[select_index] = "";
    games_forwarder[select_index] = "";
    games_subselect[select_index] = 0;
    games_shortcut[select_index] = 0;
    games_animframes[select_index] = 1;
    games_animspeed[select_index] = 0
                    
    //Decrementar
    audio_play_sfx(snd_alert);
    games_total--;            
    select_index--;
                    
    //Salvar total de jogos
    ini_open(game_save_id+"collection\\_total.ini");
    ini_write_string("NINTY_ENTRY","total",string(games_total));
    ini_close();
        
    //Checar arquivo
    if(file_exists(games_path[select_index])) select_exists = 1;
    else select_exists = 0;
        
    //Atualizar RPC
    event_user(0);
}
//Mover tudo
else{
            
    audio_play_sound(snd_loading,0,1);
    move_rest = select_index;
    alarm[10] = 10;
}

//Limpar inputs
keyboard_clear(keyboard_lastkey);
mouse_clear(mouse_lastbutton);

