/// @description Modificar Jogo

//Cópiar thumbnail temporariamente
directory_create(game_save_id+"thumbnail");
file_copy(game_save_id+"collection\\game_"+string(select_index)+".png",game_save_id+"thumbnail\\original_anim"+string_replace_all(string_format(games_animframes[select_index],2,0)," ","0")+"_speed"+string_replace_all(string_format(games_animspeed[select_index],2,0)," ","0")+".png");

//Buscar caminho...
var mod_file_path;
if(directory_exists(filename_dir(games_path[select_index])))
    mod_file_path = filename_dir(games_path[select_index])+"\\";
else
    mod_file_path = program_directory+"\\";
var mod_file = get_open_filename_ext("APP/Game (.exe, .url, .swf)|*.exe;*.url;*.swf",filename_name(games_path[select_index]),filename_dir(games_path[select_index]),"Ninty Launcher");
if(mod_file != "")
&&(mod_file != "Ninty_Launcher.exe")
&&(mod_file != "Ninty Launcher.exe")
&&(mod_file != "Ninty.exe"){

    //SFX
    audio_play_sfx(snd_addgame_step1);
    
    //Buscar miniatura...
    var mod_thumb = get_open_filename_ext("Thumbnail (256x256)|*.png;*.jpg","original_anim"+string_replace_all(string_format(games_animframes[select_index],2,0)," ","0")+"_speed"+string_replace_all(string_format(games_animspeed[select_index],2,0)," ","0")+".png",game_save_id+"thumbnail\\","Ninty Launcher");

    if(mod_thumb != ""){

        //Deletar miniatura antiga
        sprite_delete(games_thumb[select_index]);

        //Deleetar já existente na pasta
        file_delete(game_save_id+"collection\\game_"+string(select_index)+".png");
            
        //Miniatura com animação
        games_animframes[select_index] = get_anim_frames(mod_thumb);
        games_animspeed[select_index] = get_anim_speed(mod_thumb);
        games_thumb[select_index] = sprite_add(mod_thumb,get_anim_frames(mod_thumb),0,1,0,0);
        
        //Copiar nova para pasta
        file_copy(mod_thumb,game_save_id+"collection\\game_"+string(select_index)+".png");
        
        //Voltar animador ao começo
        anim_games[select_index] = 0;
    }
    
    //SFX
    audio_play_sfx(snd_addgame_step2);
                
    //É um ATALHO?
    var mod_scut = show_question(text_addgame[0]);
    if(mod_scut == 1)
        games_shortcut[select_index] = 1;
    else{

            games_shortcut[select_index] = 0;
            
            //SFX
            audio_play_sfx(snd_addgame_step2);
        
            //É um FORWARDER?
            var mod_fwarder = show_question(text_addgame[1]);
            if(mod_fwarder == 1){
            
                var mod_fward = get_open_filename_ext(""+text_addforwarder+"|*","",games_forwarder[select_index],"Ninty Launcher");
                if(mod_fward != "")
                    games_forwarder[select_index] = filename_path(mod_fward);
            }
            else
                games_forwarder[select_index] = "";      
    }

    //SFX
    audio_play_sfx(snd_addgame_step3);
        
    //Alterar jogo
    games_path[select_index] = mod_file;
    
    //Salvar no diretório
    ini_open(game_save_id+"collection\\game_"+string(select_index)+".ini");
    ini_write_string("NINTY_ENTRY","path",string(mod_file));
    ini_write_string("NINTY_ENTRY","forwarder",string(games_forwarder[select_index]));
    ini_write_string("NINTY_ENTRY","subselect",string(games_subselect[select_index]));
    ini_write_string("NINTY_ENTRY","shortcut",string(games_shortcut[select_index]));
    ini_write_string("NINTY_ENTRY","animframes",string(games_animframes[select_index]));
    ini_write_string("NINTY_ENTRY","animspeed",string(games_animspeed[select_index]));
    ini_close();

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

//Deletar thumbnail temporariamente
directory_destroy(game_save_id+"thumbnail");

