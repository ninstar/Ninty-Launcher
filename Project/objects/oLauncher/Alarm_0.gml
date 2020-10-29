/// @description Preparar para iniciar jogo

//Lembrar posição/tamanho
if(fullscreen == 0){

    temp_x = window_get_x();
    temp_y = window_get_y();
    temp_w = window_get_width();
    temp_h = window_get_height();
}

//Se launcher precisar ser suspenso...
if(boot_wait != ""){

    //Definir como suspenso
    is_playing = 1;
    draw_enable_drawevent(0);
    
    //Parar música
    if(audio_exists(wallpaper_song))
        audio_stop_sound(wallpaper_song);
        
    //Definir posição/tamanho
    window_set_position(-9000,-9000);
    //window_set_size(16,16);
    
    //Começar registro de tempo
    time_start = date_current_datetime();

    //Discord RPC
    if(nativerpc == 1){
    
        if(boot_attach == ""){
			
			//RPC
			setLargeImageKey("rpc_"+string(iconrpc));
			setLargeImageText("Ninty Launcher "+string(version_string));
			setDetails(emoji_playing+string(games_title[select_index]));
			setState(emoji_games+string(games_total)+" "+text_rpc[1]);
			UpdatePresence();
		}
		else{
        
            //Remover tags
            var stg,stp;
            stg =  string_copy(string_replace(ds_map_find_value(forwarder_list,string(forwarder_select-1)+"_r"),"."+ds_map_find_value(forwarder_list,string(forwarder_select-1)+"_e"),""),1,32);
            if(string_pos("(",stg) > 0)
                stp = string_pos("(",stg)-1;
            else
                stp = string_length(stg);
        
			//RPC
			setLargeImageKey("rpc_"+string(iconrpc));
			setLargeImageText("Ninty Launcher "+string(version_string));
			setDetails(emoji_playing+string_copy(stg,1,stp));
			setState(emoji_forward+string(games_title[select_index]));
			UpdatePresence();
		}
    }
}

//Criar .BAT direcionado ao local do jogo (evita falhas)
var test = file_text_open_write(game_save_id+"gameboot.bat")

file_text_write_string(test,"chcp 65001"); file_text_writeln(test);
file_text_write_string(test,filename_drive(games_path[select_index])); file_text_writeln(test);
file_text_write_string(test,"cd \""+filename_path(games_path[select_index])+"\""); file_text_writeln(test);
if(boot_attach == "") file_text_write_string(test,"start \"Ninty_Software\" "+boot_res+""+boot_priority+""+boot_wait+"\""+filename_name(games_path[select_index])+"\"");
else file_text_write_string(test,"start \"Ninty_Software\" "+boot_res+""+boot_priority+""+boot_wait+"\""+filename_name(games_path[select_index])+"\" "+boot_attach)

file_text_close(test);
    
//Prosseguir para inicialização
alarm[1] = 5;

