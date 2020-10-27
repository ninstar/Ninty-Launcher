/// @description Adicionar Jogo

//Buscar caminho...
var file = get_open_filename("APP/Game (.exe, .url, .swf)|*.exe;*.url;*.swf","");
if(file != "")
&&(file != "Ninty_Launcher.exe")
&&(file != "Ninty Launcher.exe")
&&(file != "Ninty.exe"){

    var thumb = find_game(file,games_total);
    
    //Checar se existe miniatura predefinida...
    if(thumb == ""){

        //SFX
        audio_play_sfx(snd_addgame_step1);
        
        //Buscar miniatura...
        thumb = get_open_filename("Thumbnail (256x256)|*.png;*.jpg","");
        if(thumb != ""){
        
            //Miniatura com animação
            games_animframes[games_total] = get_anim_frames(thumb);
            games_animspeed[games_total] = get_anim_speed(thumb);
            games_thumb[games_total] = sprite_add(thumb,get_anim_frames(thumb),0,1,0,0);
            
            //Copiar para pasta
            file_copy(thumb,game_save_id+"collection\\game_"+string(games_total)+".png");
        }
        //Indefinido
        else{
        
            //Miniatura sem animação
            games_animframes[games_total] = 1;
            games_animspeed[games_total] = 0;
            games_thumb[games_total] = sprite_add(global.assets_dir+"default.tbn",0,0,0,0,0);
        }

        //SFX
        audio_play_sfx(snd_addgame_step2);
                
        //É um ATALHO?
        var scut = show_question(text_addgame[0]);
        if(scut == 1)
            games_shortcut[games_total] = 1;
        else{
        
            games_shortcut[games_total] = 0;
            
            //SFX
            audio_play_sfx(snd_addgame_step2);
        
            //É um FORWARDER?
            var fwarder = show_question(text_addgame[1]);
            if(fwarder == 1){
            
                var fward = get_open_filename(""+text_addforwarder+" (Forwarder)|*","");
                if(fward != "")
                    games_forwarder[games_total] = filename_path(fward);
                else
                    games_forwarder[games_total] = "";
            }
            else
                games_forwarder[games_total] = "";      
        }
            
        //SFX
        audio_play_sfx(snd_addgame_step3);
        
        //Adicionar base de nome do jogo
        games_title[games_total] = string_copy(string_replace(filename_name(file),filename_ext(file),""),0,32);
    }
    else{
    
        //Sinalizar que está baixando...
        with(oDownloader)
            downloading = 1;
    
        //NOTA: Evento "Image Load" esta ativo esperando baixar a imagem...
        games_thumb[games_total] = sprite_add(thumb,games_animframes[games_total],0,1,0,0);
                    
        //Se for um forwarder...
        if(forwarder_openexplorer != 0){
       
            //SFX
            audio_play_sfx(snd_addgame_step2);
             
            //Buscar pasta de referencia
            var fward = get_open_filename(""+text_addforwarder+" (Forwarder)|*","");
            if(fward != "")
                games_forwarder[games_total] = filename_path(fward);
            else
                games_forwarder[games_total] = "";
        }

        //SFX
        audio_play_sfx(snd_addgame_step3);
    }
        
    //Adicionar animador
    anim_games[games_total] = 0;
    
    //Adicionar informações restantes do jogo
    games_subselect[games_total] = 1;
    games_path[games_total] = file;
    games_playtime[games_total,0] = 0;
    games_playtime[games_total,1] = 0;
                    
    //Salvar no diretório
    ini_open(game_save_id+"collection\\game_"+string(games_total)+".ini");
    ini_write_string("NINTY_ENTRY","forwarder",string(games_forwarder[games_total]));
    ini_write_string("NINTY_ENTRY","subselect",string("1"));
    ini_write_string("NINTY_ENTRY","shortcut",string(games_shortcut[games_total]));
    ini_write_string("NINTY_ENTRY","title",games_title[games_total]);
    ini_write_string("NINTY_ENTRY","path",string(file));
    ini_write_string("NINTY_ENTRY","animframes",string(games_animframes[games_total]));
    ini_write_string("NINTY_ENTRY","animspeed",string(games_animspeed[games_total]));
    ini_write_string("NINTY_ENTRY","0",base64_encode("0"));
    ini_write_string("NINTY_ENTRY","1",base64_encode("0"));
    ini_close();
            
    //Incrementar total
    ini_open(game_save_id+"collection\\_total.ini");
    ini_write_string("NINTY_ENTRY","total",string(games_total+1));
    ini_close();
    games_total++;
    select_index = games_total-1;
  
    //Lembrar de não abrir forwarder próxima vez...
    forwarder_openexplorer = 0;

    //Checar arquivo
    if(file_exists(games_path[select_index])) select_exists = 1;
    else select_exists = 0;
    
    //Limpar inputs
    io_clear();
    delay = 5;
    
    //Atualizar RPC
    event_user(0);
    
    //Voltar fullscreen... (Se tiver sido definido antes)    
    window_set_fullscreen(fullscreen);
}
//Voltar fullscreen... (Se tiver sido definido antes)    
else{

    //Limpar inputs
    io_clear();
    delay = 5;

    audio_play_sfx(snd_alert);
    window_set_fullscreen(fullscreen);
}

