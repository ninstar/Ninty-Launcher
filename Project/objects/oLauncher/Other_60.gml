/// @description Mover imagem para destino após baixar (Adicionar jogo)
/// @param Adicionar jogo
if(ds_map_find_value(async_load,"id") == games_thumb[async_thumbnail]){
    
    //Se download finalizar...
    if(ds_map_find_value(async_load,"status") < 1){
    
        //Salvar thumbnail na pasta
        sprite_save_strip(games_thumb[async_thumbnail],game_save_id+"collection\\game_"+string(async_thumbnail)+".png");
        
        //Finalizado
        async_thumbnail = -1;
        with(oDownloader)
            downloading = 0;
    }
    else{
    
        with(oDownloader)
            downloading = 1;
    }
}

