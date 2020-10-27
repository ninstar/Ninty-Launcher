/// @description Alterar nome do jogo
if(dialog == 1)
    alarm[6] = 1;
else{
   
    //Adicionar jogo
    games_title[select_index] = dialog_return;

    //Salvar alteração
    ini_open(game_save_id+"collection\\game_"+string(select_index)+".ini");
    ini_write_string("NINTY_ENTRY","title",string(dialog_return));
    ini_close();
    
    //Limpar inputs
    io_clear();
    delay = 5;
}

