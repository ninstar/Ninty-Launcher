/// @description Controladores
if(delay > 0)
    delay--;

//Ignorar quando suspenso
if(is_playing == 1)
||(delay > 0)
||(alarm[7] != -1)
||(alarm[8] != -1)
||(alarm[9] != -1)
||(alarm[10] != -1)
||(alarm[11] != -1)
    exit;

//Checar região fora do submenu
if(point_in_rectangle(mouse_x,mouse_y,0,0,320,720))
||(point_in_rectangle(mouse_x,mouse_y,321,0,1042,37))
||(point_in_rectangle(mouse_x,mouse_y,321,676,1042,720))
||(point_in_rectangle(mouse_x,mouse_y,959,94,1280,675))
||(point_in_rectangle(mouse_x,mouse_y,959,38,1042,93))
||(point_in_rectangle(mouse_x,mouse_y,1233,0,1280,93))
    outside_submenu = 1;
else
    outside_submenu = 0;

//------------- Forwarder -------------

//SE for permitido buscar níveis...
if(forwarder_find == 1){
    
    //Enquanto existir algum arquivo durante busca...
    while(forwarder_file != undefined){
   
        //Se não tiver nenhum arquivo...   
        if(forwarder_file == undefined)
        ||(forwarder_file == ""){
            
            //Terminar busca
            file_find_close();
          
            //Parar permissão de busca
            forwarder_find = 0;
            forwarder_total--;
            
            //Posicionar seletor
            if(forwarder_total > 0)
            &&(forwarder_subfolder == ""){
            
                if(games_subselect[select_index] > forwarder_total){
            
                    if(forwarder_total > 14)
                        forwarder_listoffset = forwarder_total-15;
                    else
                        forwarder_listoffset = 0;
                        
                    forwarder_select = forwarder_total-1;
                }
                else{
            
                    if(games_subselect[select_index] > 14)
                        forwarder_listoffset = games_subselect[select_index]-14;
                    else
                        forwarder_listoffset = 0;
                        
                    forwarder_select = games_subselect[select_index];
                }
            }          
            else
                forwarder_select = 0;
            
            //Parar loop
            break;
            exit;
        }
               
        //Buscar pelo próximo
        forwarder_file = file_find_next();
        
        //Incluir NOME REAL (Com extensão) do arquivo a lista
        ds_map_add(forwarder_list,string(forwarder_total)+"_r",filename_name(forwarder_file));
         
        //Incluir EXTENSÃO do arquivo a lista
        ds_map_add(forwarder_list,string(forwarder_total)+"_e",string_replace(filename_ext(forwarder_file),".",""));

        //Incrementar total de aquivos
        forwarder_total++;
    }
}

//------------- Cor Seletor -------------

if(col_mod == 0){

    if(col_numb < 1)
        col_numb += 0.025;
    else
        col_mod =! col_mod;
}
else{

    if(col_numb > 0)
        col_numb -= 0.025;
    else
        col_mod =! col_mod;
}

//------------- Parental -------------

//Delay
if(parental_unlock > 0)
    parental_unlock--;

//Animação
if(parental_control == 1){
    
    //Opacidade
    if(parental_fadeicons > 0)
        parental_fadeicons -= 0.1;
    else
        parental_fadeicons = 0;
        
    //Scroll
    if(parental_offset < 48-6)
        parental_offset += 6;
    else
        parental_offset = 48;
}
else{

    //Opacidade
    if(parental_fadeicons < 1)
        parental_fadeicons += 0.1;
    else
        parental_fadeicons = 1;
        
    //Scroll    
    if(parental_offset > 6)
        parental_offset -= 6;
    else
        parental_offset = 0;
}

//------------- Janela -------------
if((mouse_check_button(mb_right))
||(mouse_check_button(mb_middle)))
&&!(window_get_fullscreen()){

    //Mover
    window_set_position(display_mouse_get_x()-window_get_width()/2,display_mouse_get_y()-window_get_height()/2);
    temp_x = window_get_x();
    temp_y = window_get_y();
}

//------------- Controles -------------

//WASD
keyboard_set_map(ord("W"),vk_up);
keyboard_set_map(ord("A"),vk_left);
keyboard_set_map(ord("S"),vk_down);
keyboard_set_map(ord("D"),vk_right);

//Gamepad
var gp_count;
for(gp_count = 0; gp_count < 5; gp_count += 1){

    if(gamepad_is_connected(gp_count))
    &&(dialog == 0){
         
        //Up (Stick)
        if(gp_stick[gp_count,0] == 0)
        &&(gamepad_axis_value(gp_count,gp_axislv) <= -0.5){
        
            gp_stick[gp_count,0] = 1;
            keyboard_key_press(vk_up);
        }
        else if(gp_stick[gp_count,0] == 1)
        &&(gamepad_axis_value(gp_count,gp_axislv) > -0.5){
        
            gp_stick[gp_count,0] = 0;
            keyboard_key_release(vk_up);
        }
    
        //Down (Stick)
        if(gp_stick[gp_count,1] == 0)
        &&(gamepad_axis_value(gp_count,gp_axislv) >= 0.5){
        
            gp_stick[gp_count,1] = 1;
            keyboard_key_press(vk_down);
        }
        else if(gp_stick[gp_count,1] == 1)
        &&(gamepad_axis_value(gp_count,gp_axislv) < 0.5){
        
            gp_stick[gp_count,1] = 0;
            keyboard_key_release(vk_down);
        }
        
        //Left (Stick)
        if(gp_stick[gp_count,2] == 0)
        &&(gamepad_axis_value(gp_count,gp_axislh) <= -0.5){
        
            gp_stick[gp_count,2] = 1;
            keyboard_key_press(vk_left);
        }
        else if(gp_stick[gp_count,2] == 1)
        &&(gamepad_axis_value(gp_count,gp_axislh) > -0.5){
        
            gp_stick[gp_count,2] = 0;
            keyboard_key_release(vk_left);
        }
    
        //Right (Stick)
        if(gp_stick[gp_count,3] == 0)
        &&(gamepad_axis_value(gp_count,gp_axislh) >= 0.5){
        
            gp_stick[gp_count,3] = 1;
            keyboard_key_press(vk_right);
        }
        else if(gp_stick[gp_count,3] == 1)
        &&(gamepad_axis_value(gp_count,gp_axislh) < 0.5){
        
            gp_stick[gp_count,3] = 0;
            keyboard_key_release(vk_right);
        }
    
        //Up - Fim da lista
        if(gamepad_button_check(gp_count,gp_padu))
            keyboard_key_press(vk_up);
        else if(gamepad_button_check_released(gp_count,gp_padu))
            keyboard_key_release(vk_up);
            
        //Down - Começo da lista
        if(gamepad_button_check(gp_count,gp_padd))
            keyboard_key_press(vk_down);
        else if(gamepad_button_check_released(gp_count,gp_padd))
            keyboard_key_release(vk_down);
    
        //Left / L
        if(gamepad_button_check(gp_count,gp_padl))
            keyboard_key_press(vk_left);
        else if(gamepad_button_check_released(gp_count,gp_padl))
            keyboard_key_release(vk_left);
            
        if(gamepad_button_check(gp_count,gp_shoulderl))
            keyboard_key_press(vk_left);
        else if(gamepad_button_check_released(gp_count,gp_shoulderl))
            keyboard_key_release(vk_left);
        
        //Right / R
        if(gamepad_button_check(gp_count,gp_padr))
            keyboard_key_press(vk_right);
        else if(gamepad_button_check_released(gp_count,gp_padr))
           keyboard_key_release(vk_right);
           
        if(gamepad_button_check(gp_count,gp_shoulderr))
            keyboard_key_press(vk_right);
        else if(gamepad_button_check_released(gp_count,gp_shoulderr))
           keyboard_key_release(vk_right);

        //Generico (DirecInput)
        if(gp_count == 4){

            //1, 4 e Select - Mover
            if(gamepad_button_check_pressed(gp_count,gp_face1))
                keyboard_key_press(vk_shift);
            else if(gamepad_button_check_released(gp_count,gp_face1))
                keyboard_key_release(vk_shift);
                
            if(gamepad_button_check_pressed(gp_count,gp_face4))
                keyboard_key_press(vk_shift);
            else if(gamepad_button_check_released(gp_count,gp_face4))
                keyboard_key_release(vk_shift);
    
            if(gamepad_button_check_pressed(gp_count,gp_select))
                keyboard_key_press(vk_shift);
            else if(gamepad_button_check_released(gp_count,gp_select))
                keyboard_key_release(vk_shift);
                                
            //2 e Start - Iniciar
            if(gamepad_button_check_pressed(gp_count,gp_face2))
                keyboard_key_press(vk_enter);
            else if(gamepad_button_check_released(gp_count,gp_face2))
                keyboard_key_release(vk_enter);
                
            if(gamepad_button_check_pressed(gp_count,gp_start))
                keyboard_key_press(vk_enter);
            else if(gamepad_button_check_released(gp_count,gp_start))
                keyboard_key_release(vk_enter);
            
            //3 - Cancelar
            if(gamepad_button_check_pressed(gp_count,gp_face3))
                keyboard_key_press(vk_escape);
            else if(gamepad_button_check_released(gp_count,gp_face3))
                keyboard_key_release(vk_escape);
        }    
        //Joy-Cons / Nintendo Switch Pro Controller (XInput) [também XBOX]
        else{
        
            //X, Y e Select - Mover
            if(gamepad_button_check_pressed(gp_count,gp_face3))
                keyboard_key_press(vk_shift);
            else if(gamepad_button_check_released(gp_count,gp_face3))
                keyboard_key_release(vk_shift);
                
            if(gamepad_button_check_pressed(gp_count,gp_face4))
                keyboard_key_press(vk_shift);
            else if(gamepad_button_check_released(gp_count,gp_face4))
                keyboard_key_release(vk_shift);
    
            if(gamepad_button_check_pressed(gp_count,gp_select))
                keyboard_key_press(vk_shift);
            else if(gamepad_button_check_released(gp_count,gp_select))
                keyboard_key_release(vk_shift);
                                
            //A e Start - Iniciar
            if(gamepad_button_check_pressed(gp_count,gp_face2))
                keyboard_key_press(vk_enter);
            else if(gamepad_button_check_released(gp_count,gp_face2))
                keyboard_key_release(vk_enter);
                
            if(gamepad_button_check_pressed(gp_count,gp_start))
                keyboard_key_press(vk_enter);
            else if(gamepad_button_check_released(gp_count,gp_start))
                keyboard_key_release(vk_enter);
            
            //B - Cancelar
            if(gamepad_button_check_pressed(gp_count,gp_face1))
                keyboard_key_press(vk_escape);
            else if(gamepad_button_check_released(gp_count,gp_face1))
                keyboard_key_release(vk_escape);
        }
    }
    if(gp_count > 4)
        gp_count = 0;
}

//------------- Sobreposto -------------

if(mouse_check_button_released(mb_left)){

    //Minimizar
    if(point_in_rectangle(mouse_x,mouse_y,1063,41,1063+34,41+34)){
    
        window_command_run(window_command_minimize);
    }
    //Fullscreen
    if(point_in_rectangle(mouse_x,mouse_y,1121,41,1121+34,41+34))
    &&(alarm[4] == -1){
        
        audio_play_sfx(snd_window_open);
        fullscreen =! fullscreen;
        alarm[4] = 4;
    }
    //Fechar
    if(point_in_rectangle(mouse_x,mouse_y,1170,41,1170+34,41+34))
        game_end();
}
    
//Checagem de inputs
if(window_has_focus())
&&(alarm[0] == -1)
&&!(instance_exists(oNinny)){

//Voltar música
if(audio_is_paused(wallpaper_song))
    audio_resume_sound(wallpaper_song);
        
//------------- Dialogo -------------

//Efeito blink (a cada 60 frames)
if(blink_delay > 0)
    blink_delay--;
else{

    if(dialog != 0){
    
        if(string_length(dialog_return) < 32){
        
            if(dialog_inputb == " ")
                dialog_inputb = "_";
            else
                dialog_inputb = " ";
        }
        else
             dialog_inputb = "";
    }
    
    if(clock_blink == " ")
        clock_blink = ":";
    else
        clock_blink = " ";
        
    //Próximo
    blink_delay = 60;
}

//Inserir texto
if(dialog != 0){

    //Animação de transição (Começo)
    if(dialog_filterright < 1280)
        dialog_filterright += 128;
    dialog_filterleft = -1;
    
    if(window_has_focus()){
    
        //Confirmar
        if((keyboard_check_pressed(vk_enter))
        ||(mouse_check_button_released(mb_left)))
        &&(dialog_filterright > 1279)
        &&!(point_in_rectangle(mouse_x,mouse_y,1063,41,1170+34,41+34)){
        
            delay = 5;
            audio_play_sfx(snd_addgame_step3);
            dialog = 0;
            exit;
        }
        
        //Clipboard
        if(keyboard_check(vk_control)){
        
            //Colar
            if(keyboard_check_pressed(ord("V"))){
            
                audio_play_sfx(snd_keyboard);
                keyboard_string = string_copy(clipboard_get_text(),0,32);
                dialog_return = string_copy(clipboard_get_text(),0,32);
            }
            //Copiar
            else if(keyboard_check_pressed(ord("C"))){
            
                audio_play_sfx(snd_keyboard);
                clipboard_set_text(dialog_return);
            }
        }
        else{
        
            //SFX de tecla
            if(keyboard_check_pressed(vk_anykey))
                audio_play_sfx(snd_keyboard);
            
            //Trocar caracteres inválidos
            if(keyboard_check(vk_anykey)){
            
                var stg_a,stg_b,stg_c;
                stg_a = string_copy(keyboard_string,0,32);
                stg_b = string_replace(stg_a,"#","");
                stg_c = string_replace(stg_b,"'","");
                keyboard_string = stg_c;
                dialog_return = stg_c;
            }
        }
        
        //Pesquisar jogo
        if(dialog == 2){
        
            var s;
            for(s=0; s<games_total; s+=1){
                
                //if(dialog_return == string_copy(games_title[s],1,string_count(dialog_return,dialog_return))){
                if(string_lower(dialog_return) == string_lower(string_copy(games_title[s],1,string_length(dialog_return)))){
                
                    if(select_index != s){
                    
                        offset_v = 0;
                        select_index = s;
    
                        //Checar arquivo
                        if(file_exists(games_path[select_index])) select_exists = 1;
                        else select_exists = 0;
                    }
                    break;
                }
            }
        }
    }
    exit;
}
else{

    //Animação de transição (Fim)
    if(dialog_filterright >= 1280){
    
        if(dialog_filterleft < 1280)
            dialog_filterleft += 128;
        else{

            dialog_filterright = -1;
            dialog_filterleft = -1;
        }
    }
}

//------------- Cancelar ações -------------

if((keyboard_check_pressed(vk_escape))
||(keyboard_check_pressed(vk_backspace))){
                  
    //Configurações...
    if(settingsmenu == 1){
        
        //SFX
        audio_play_sfx(snd_updated);
        settingsmenu = 0;
    }
    
    //Forwarder...      
    if(forwarder == 1){
        
        //SFX
        audio_play_sfx(snd_window_close);
        
        //Sair de subpasta
        if(forwarder_subfolder != "")
        &&(forwarder_find == 0){
                            
            //Limpar lista anterior
            ds_map_clear(forwarder_list);
                            
            //Reiniciar posição e total
            forwarder_select = 0;
            forwarder_subfolder = "";
            forwarder_subfolder_path = "";
            forwarder_total = 0;
            forwarder_listoffset = 0;

            //Procurar primeiro arquivo...
            forwarder_file = file_find_first(filename_path(games_forwarder[select_index])+"*",fa_directory);
                            
            //Permitir procurar próximos
            forwarder_find = 1;
        }
        //Fechar
        else
            forwarder = 0;
    }
    
    //Movimento dos jogos...
    if(move == 1){
    
        delay = 5;
        
        //SFX
        audio_play_sfx(snd_window_close);
                            
        //Finalizar
        move = 0;
        move_origin = -1;
    }
}
if(mouse_check_button_released(mb_left))
&&(outside_submenu == 1){
    
     //Forwarder...      
    if(forwarder == 1){

        //SFX
        audio_play_sfx(snd_window_close);
        forwarder = 0;
        exit;
    }   
}

//------------- Bloqueio da interface -------------

if(point_in_rectangle(mouse_x,mouse_y,77,41,77+34,41+34)){
        
    if(mouse_check_button_pressed(mb_left)){
    
        if(parental_unlock >= 30){
        
            audio_play_sfx(snd_parentalcontrol);
            parental_control =! parental_control;
            parental_unlock = 0;
            parental_fade = 3;
        }
        else
            parental_unlock += 29;
    }
}

//------------- Icones de opções -------------


//Pesquisar jogo
if(keyboard_check_pressed(vk_space)){

    if(alarm[6] == -1)
    &&(alarm[7] == -1)
    &&(alarm[8] == -1)
    &&(alarm[9] == -1)
    &&(dialog == 0)
    &&(forwarder == 0)
    &&(settingsmenu == 0)
    &&(infopopup == 0)
    &&(move == 0)
    &&(async_thumbnail == -1)
    &&(games_total > 0){
    
        audio_play_sfx(snd_changetitle);
        dialog_description = text_icon[2]+":";
        keyboard_string = "";
        dialog_return = "";
        dialog = 2;
    }
}

if(alarm[6] == -1)
&&(alarm[7] == -1)
&&(alarm[8] == -1)
&&(alarm[9] == -1)
&&(dialog == 0)
&&(forwarder == 0)
&&(settingsmenu == 0)
&&(infopopup == 0)
&&(move == 0)
&&(async_thumbnail == -1)
&&(parental_control == 0){

    
    //Seletor de icones
    if(point_in_rectangle(mouse_x,mouse_y,328,504,328+86,504+86)) icon_select = 0;
    else if(point_in_rectangle(mouse_x,mouse_y,436,504,436+86,504+86)) icon_select = 1;
    else if(point_in_rectangle(mouse_x,mouse_y,544,504,544+86,504+86)) icon_select = 2;
    else if(point_in_rectangle(mouse_x,mouse_y,653-parental_offset,504,(653+86)-parental_offset,504+86)) icon_select = 3;
    else if(point_in_rectangle(mouse_x,mouse_y,761-parental_offset,504,(761+86)-parental_offset,504+86)) icon_select = 4;
    else if(point_in_rectangle(mouse_x,mouse_y,869-parental_offset,504,(869+86)+parental_offset,504+86)) icon_select = 5;
    else icon_select = -1;
       
    //Icones
    if(mouse_check_button_released(mb_left)){
            
        //Configurações do Launcher
        if(point_in_rectangle(mouse_x,mouse_y,595,662,595+44,662+44)){
        
            if(settingsmenu == 0)
            &&(settingsmenu_fade == 0){
            
                settingsmenu = 1;
                
                //SFXsnd_settings
                audio_play_sfx(snd_settings);
            }
        }
        //Informações do Launcher
        if(point_in_rectangle(mouse_x,mouse_y,641,662,641+44,662+44)){
        
            if(infopopup == 0)
            &&(infopopup_fade == 0){
            
                infopopup = 1;
                
                //SFX
                audio_play_sfx(snd_window_open);
            }
        }
            
        //Modo de Hora (12/24)
        if(point_in_rectangle(mouse_x,mouse_y,120,41,120+128,41+34)){
            
            time_12h =! time_12h;
            
            //SFX
            audio_play_sfx(snd_window_open);            
        }

        //----------------
    
        //Deletar jogo
        if(icon_select == 0)
        &&(games_total > 0){
        
            //Chamar Ninny
            with(instance_create(0,0,oNinny)){
                    
                update = 2;
                update_select = 1;
                def_text = 32;
                event_user(2);
            }
        }
          
        //Alterar jogo
        if(icon_select == 1)
        &&(games_total > 0){
        
            audio_play_sfx(snd_changethumbnail);
            window_set_fullscreen(0);
            alarm[9] = 4;
        }
          
        //Pesquisar jogo
        if(icon_select == 2)
        &&(games_total > 0)
        &&(dialog == 0){
        
            audio_play_sfx(snd_changetitle);
            dialog_description = text_icon[2]+":";
            keyboard_string = "";
            dialog_return = "";
            dialog = 2;
        }
               
        //Tema (Branco/Preto)
        if(icon_select == 3){
        
            theme =! theme;
            if(theme == 0)
                audio_play_sfx(snd_theme_white);
            else
                audio_play_sfx(snd_theme_black);
        }
    
        //Alterar wallpaper
        if(icon_select == 4){
        
            audio_play_sfx(snd_wallpaper);
            window_set_fullscreen(0);
            alarm[8] = 4;
        }
        
        //Adicionar jogo
        if(icon_select == 5){
        
            audio_play_sfx(snd_addgame);
            window_set_fullscreen(0);
            alarm[7] = 4;
        }
    }
}
else
    icon_select = -1;

//------------- Menu de Forwarder -------------
if(forwarder == 1)
&&(forwarder_fade > 0.1){

    //Abri pasta
    if(point_in_rectangle(mouse_x,mouse_y,347,67,931,105)){
        
        if(mouse_check_button_released(mb_left)){
        
            ExecuteShell("\""+games_forwarder[select_index]+"\"",0,0);
        }
    }
}
if(forwarder == 1)
&&(forwarder_fade > 0.1)
&&(forwarder_total > 0){
    
    //Navegação com mouse
    /*if(mouse_x > 350) 
    if(mouse_y > 110)
    if(mouse_x < 350+575)
    if(mouse_y < 110+496){
        
        //Selecionar
        var f;
        for(f=0; f<15; f+=1){
        
            if(mouse_y > 125+(32*f)){
            
                if(forwarder_select > forwarder_listoffset-1)
                if(forwarder_select < forwarder_listoffset+15)
                    forwarder_select = f+forwarder_listoffset;
            }
        }
        
        //Iniciar
        if(mouse_check_button_released(mb_left)){
        
            keyboard_key_press(vk_enter);
            keyboard_key_release(vk_enter);
        }        
    }*/
    
    //Navegação rápida (Loop)
    if(keyboard_check(vk_down)){
    
        //Intervalo
        if(nav_time > 0)
            nav_time--;
        else{
        
            //Delay em frames
            nav_time = 2;
            
            //Próximo
            if(forwarder_select < forwarder_total-1){
            
                forwarder_select++;
                if(forwarder_select > forwarder_listoffset+14)
                    forwarder_listoffset++;
                audio_play_sfx(snd_select_next);
            }            
            else{
                
                if(forwarder_total > 14)
                    forwarder_listoffset = 0;
                forwarder_select = 0;
                audio_play_sfx(snd_select_border);
            }
        }
    }
    else if(keyboard_check(vk_up)){
    
        //Intervalo
        if(nav_time > 0)
            nav_time--;
        else{
            
            //Delay em frames
            nav_time = 2;
                    
            //Anterior
            if(forwarder_select > 0){
            
                forwarder_select--;
                if(forwarder_select < forwarder_listoffset)
                    forwarder_listoffset--;
                audio_play_sfx(snd_select_previous);
            }
            else{
            
                if(forwarder_total > 14)
                    forwarder_listoffset = forwarder_total-15;
                forwarder_select = forwarder_total-1;
                audio_play_sfx(snd_select_border);
            }
        }
    }
    else
        nav_time = 30;

    //Normal
    if(keyboard_check_pressed(vk_down)){
        
        //Próximo
        if(forwarder_select < forwarder_total-1){
        
            forwarder_select++;
            if(forwarder_select > forwarder_listoffset+14)
                forwarder_listoffset++;
            audio_play_sfx(snd_select_next);
        }
        else{
            
            if(forwarder_total > 14)
                forwarder_listoffset = 0;
            forwarder_select = 0;
            audio_play_sfx(snd_select_border);
        }
    }
    else if(keyboard_check_pressed(vk_up)){
    
        //Anterior
        if(forwarder_select > 0){
        
            forwarder_select--;
            if(forwarder_select < forwarder_listoffset)
                forwarder_listoffset--;
            
            audio_play_sfx(snd_select_previous);
        }
        else{
        
            if(forwarder_total > 14)
                forwarder_listoffset = forwarder_total-15;
            forwarder_select = forwarder_total-1;
            audio_play_sfx(snd_select_border);
        }
    }
}

//------------- Menu de Configurações -------------
if(settingsmenu == 1)
&&(settingsmenu_fade > 0.1){
    
    settingsmenu_select = -1;
    
    //Navegação
    if(mouse_x > 350) 
    if(mouse_y > 110)
    if(mouse_x < 350+575)
    if(mouse_y < 110+540){
    
        if(mouse_y > 125) settingsmenu_select = 0;
        if(mouse_y > 125+(32*1)) settingsmenu_select = 1;
        if(mouse_y > 125+(32*2)) settingsmenu_select = 2;
        if(mouse_y > 125+(32*3)) settingsmenu_select = 3;
        if(mouse_y > 125+(32*4)) settingsmenu_select = 4;
        if(mouse_y > 125+(32*5)) settingsmenu_select = 5;
        if(mouse_y > 125+(32*6)) settingsmenu_select = 6;
        if(mouse_y > 125+(32*7)+32) settingsmenu_select = 7;
        if(mouse_y > 125+(32*8)+32) settingsmenu_select = 8;
        if(mouse_y > 125+(32*9)+64) settingsmenu_select = 9;
        if(mouse_y > 125+(32*10)+64) settingsmenu_select = 10;
    }
    
    //Ações e opções
    if(mouse_check_button_released(mb_left)){
    
        //Idioma
        if(settingsmenu_select == 0){
        
            if(language < text_settings_language_total)
                language++;
            else
                language = 0;
            
            //Mudar idioma
            event_user(3);
            
            //Atualizar RPC
            event_user(0);
        }
        //Renderização da Interface
        else if(settingsmenu_select == 1){
        
            uirender =! uirender;
          
            //Definições de display
            event_user(6);
        }
        //Efeitos Sonoros
        else if(settingsmenu_select == 2){
        
            soundeffects =! soundeffects;
            
            //Volume dos SFXs
            audio_group_set_gain(sound_effects,soundeffects,0);
        }
        //Proporção dos jogos
        else if(settingsmenu_select == 3){
        
            if(windowmode < 2)
                windowmode++;
            else
                windowmode = 0;
        }
        //Prioridade dos jogos
        else if(settingsmenu_select == 4){
        
            if(gamepriority < 2)
                gamepriority++;
            else
                gamepriority = 0;
        }
        //Checar atualizações
        else if(settingsmenu_select == 5)
            updateninty =! updateninty;
        //Atualizar base de dados
        else if(settingsmenu_select == 6)
            updatedatabase =! updatedatabase;
        //Pasta de Perfil
        else if(settingsmenu_select == 7){
            ExecuteShell(game_save_id,0,0);
        }
        //Guia Interativo
        else if(settingsmenu_select == 8){
        
            if!(instance_exists(oNinny)){
                
                with(instance_create(0,0,oNinny)){
                    event_user(2);
                }
                exit;
            }
        }
        //Discord RPC
        else if(settingsmenu_select == 9){
        
            nativerpc =! nativerpc;
            
            //Rich Presence
            if(nativerpc == 1){
            
                InitDiscord("518643988778057729");
                
                //Atualizar RPC
                event_user(0);
            }
            else{
            
                //Desativar RPC
                FreeDiscord();
            }
        } 
        //Icone Discord RPC
        else if(settingsmenu_select == 10){

            //Icone
            if(mouse_x > 348) iconrpc = 0;
            if(mouse_x > 348+(152*1)) iconrpc = 1;
            if(mouse_x > 348+(152*2)) iconrpc = 2;
            if(mouse_x > 348+(152*3)) iconrpc = 3;
            
            //Atualizar RPC
            event_user(0);
        }
        //Fechar
        if(outside_submenu == 1){
        
            //SFX
            audio_play_sfx(snd_updated);
            settingsmenu = 0;
            exit;
        }  
        //SFX
        if(settingsmenu_select > -1)   
            audio_play_sfx(snd_window_open);
    }
}
            
//Retirar Popup de informações
if(infopopup == 1)
&&(infopopup_fade == 1){

    if(keyboard_check_pressed(vk_anykey))
    ||(mouse_check_button_released(mb_left)){
    
        //Página do Launcher (Pop-up)
        if(point_in_rectangle(mouse_x,mouse_y,411,82,411+441,82+140))
            url_open(global.redirect_about);
        else{
        
            if(mouse_check_button_released(mb_left)){
            
                if(outside_submenu == 0)
                    exit;
            }
        
            //SFX
            audio_play_sfx(snd_window_close);
            infopopup = 0;
            exit;
        }
    }
}

//------------- Seleção de Jogos -------------
if(games_total > 0)
&&(dialog == 0)
&&(async_thumbnail == -1)
&&(settingsmenu == 0){

    //Bloquear navegação enquanto estiver em menu de forwarder...
    if(forwarder == 0){
    
        //Mover jogo...
        if(move == 0)
        &&(parental_control == 0){
            
            //...com teclado
            if(keyboard_check_pressed(vk_shift)){
            
                move = 1;
                move_origin = select_index;
                
                //SFX
                audio_play_sfx(snd_window_open);
            }
            //...com mouse
            else if(mouse_check_button(mb_left)){
    
            
                //Rolagem (de acordo com offset)
                var b_offset;
                if(select_index > 1)
                    b_offset = 502+(-276*select_index);
                else
                    b_offset = 98;
                    
                //Jogo selecioando
                if(point_in_rectangle(mouse_x,mouse_y,b_offset+(276*select_index),194+parental_offset,b_offset+256+(276*select_index),(194+256)+parental_offset)){
         
                    //Esperar...
                    mov_time++;
                    
                    //Mover quando passar tempo suficiente segurando
                    if(mov_time > 30){
                        
                        move = 1;
                        move_origin = select_index;
                            
                        //SFX
                        audio_play_sfx(snd_window_open);
                    }
                }
                else
                    mov_time = 0;
            }
            else
                mov_time = 0;
        }
                                    
        //Navegação por Mouse
        if(mouse_check_button_released(mb_left))
        &&(infopopup_fade == 0)
        &&(settingsmenu_fade == 0){
           
            //Rolagem (de acordo com offset)
            var q_offset;
            if(select_index > 1)
                q_offset = 502+(-276*select_index);
            else
                q_offset = 98;
                    
            //Alterar nome
            if(point_in_rectangle(mouse_x,mouse_y,q_offset+(276*select_index),125-offset_v+parental_offset,q_offset+256+(276*select_index),(125+52)-offset_v+parental_offset))
            &&(parental_control == 0){
                
                audio_play_sfx(snd_changetitle);
                dialog_description = text_dialog[0];
                keyboard_string = games_title[select_index];
                dialog_return = games_title[select_index];
                dialog = 1;
                alarm[6] = 1;       
            }

            //Lista de jogos (Mostrar apenas oque esta na tela)
            var q, q_start, q_end;
            if(select_index > 1){
            
                q_start = select_index-2;
                q_end = select_index+3;
            }
            else{
            
                q_start = 0;
                q_end = select_index+5;
            }
            
            for(q=q_start; q<q_end; q+=1){
                
                //Seleção
                if(point_in_rectangle(mouse_x,mouse_y,q_offset+(276*q),194+parental_offset,q_offset+256+(276*q),(194+256)+parental_offset))
                &&!(q < 0)
                &&!(q > games_total-1){
                
                    //Efeito
                    if(q == select_index){
                    
                        if(mov_time == 0){
                        
                            keyboard_key_press(vk_enter);
                            keyboard_key_release(vk_enter);
                        }
                        else
                            mov_time = 0;
                    }
                    if(q < select_index){
                        
                        offset_v = 0;
                        select_index = q;
                        audio_play_sfx(snd_select_previous);   
                    
                        //Checar arquivo
                        if(file_exists(games_path[select_index])) select_exists = 1;
                        else select_exists = 0;
                        exit;                     
                    }
                    if(q > select_index){
                    
                        offset_v = 0;
                        select_index = q;
                        audio_play_sfx(snd_select_next);
                        
                        //Checar arquivo
                        if(file_exists(games_path[select_index])) select_exists = 1;
                        else select_exists = 0;
                        exit;
                    }
                }
            }
        }
        //Navegação rápida (Loop)
        else if(keyboard_check(vk_right)){
        
            //Intervalo
            if(nav_time > 0)
                nav_time--;
            else{
            
                //Delay em frames
                nav_time = 5;
                
                //Próximo
                if(select_index < games_total-1){
                
                    select_index++;
                    audio_play_sfx(snd_select_next);
                    
                    //Checar arquivo
                    if(file_exists(games_path[select_index])) select_exists = 1;
                    else select_exists = 0;
                }
            }
        }
        else if(keyboard_check(vk_left)){
        
            //Intervalo
            if(nav_time > 0)
                nav_time--;
            else{
                
                //Delay em frames
                nav_time = 5;
                        
                //Anterior
                if(select_index > 0){
                
                    select_index--;
                    audio_play_sfx(snd_select_previous);
        
                    //Checar arquivo
                    if(file_exists(games_path[select_index])) select_exists = 1;
                    else select_exists = 0;
                }
            }
        }
        else
            nav_time = 30;
    
        //Normal
        if(keyboard_check_pressed(vk_right)){
            
            mov_time = 0;
            offset_v = 0;
            
            //Próximo
            if(select_index < games_total-1){
            
                select_index++;
                audio_play_sfx(snd_select_next);
                
                //Checar arquivo
                if(file_exists(games_path[select_index])) select_exists = 1;
                else select_exists = 0;
            }
            else
                audio_play_sfx(snd_select_border);
        }
        else if(keyboard_check_pressed(vk_left)){
        
            mov_time = 0;
            offset_v = 0;
            
            //Anterior
            if(select_index > 0){
            
                select_index--;
                audio_play_sfx(snd_select_previous);
                
                //Checar arquivo
                if(file_exists(games_path[select_index])) select_exists = 1;
                else select_exists = 0;
            }
            else
                audio_play_sfx(snd_select_border);
        }
        else if(keyboard_check_pressed(vk_up)){
        
            mov_time = 0;
            offset_v = 0;
            
            //Fim
            select_index = games_total-1;
            audio_play_sfx(snd_select_border);
            
            //Checar arquivo
            if(file_exists(games_path[select_index])) select_exists = 1;
            else select_exists = 0;
        }
        else if(keyboard_check_pressed(vk_down)){
        
            mov_time = 0;
            offset_v = 0;
            
            //Começo
            select_index = 0;
            audio_play_sfx(snd_select_border);
            
            //Checar arquivo
            if(file_exists(games_path[select_index])) select_exists = 1;
            else select_exists = 0;
        }
    }

    //Multi-funções para tecla Enter
    if(keyboard_check_pressed(vk_enter)){
    
        //Enter + Alt
        if(keyboard_check(vk_alt)){
            
            //Fullscreen
            audio_play_sfx(snd_window_open);
            fullscreen =! fullscreen;
            alarm[4] = 4;
        }
        //Padrões
        else{

            //Confirmar após mover
            if(move == 1){
                
                mov_time = 0;
                
                //Se for local diferente...
                if(select_index != move_origin){
                        
                    //SFX
                    audio_play_sfx(snd_move_pick);
                    games_title[select_index] = text_moving;
                            
                    //Copiar
                    move_temp_title = games_title[move_origin];
                    move_temp_path = games_path[move_origin];
                    move_temp_forwarder = games_forwarder[move_origin];
                    move_temp_subselect = games_subselect[move_origin];
                    move_temp_shortcut = games_shortcut[move_origin];
                    move_temp_animframes = games_animframes[move_origin];
                    move_temp_animspeed = games_animspeed[move_origin];
                    move_temp_playtime[0] = games_playtime[move_origin,0];
                    move_temp_playtime[1] = games_playtime[move_origin,1];
                    move_temp_thumbnail = sprite_duplicate(games_thumb[move_origin]);
                            
                    //Deletar de origem
                    sprite_delete(games_thumb[move_origin]);
                            
                    //Renomear arquivo de origem temporariamente...
                    file_rename(game_save_id+"collection\\game_"+string(move_origin)+".ini",game_save_id+"collection\\game_TMP.ini");
                    file_rename(game_save_id+"collection\\game_"+string(move_origin)+".png",game_save_id+"collection\\game_TMP.png");
                            
                    //Mover arquivo destino apra de origem...
                    alarm[11] = 10;
                }
                //Voltar a local de origem...
                else{
                        
                    //SFX
                    audio_play_sfx(snd_window_close);
                            
                    //Finalizar
                    move = 0;
                    move_origin = -1;
                }
            }
            //Iniciar...
            else{

                //Checar se software existe
                if(select_exists == 1)
                &&(oDownloader.downloading == 0){
                
                    //SE for um forwarder...    
                    if(games_forwarder[select_index] != "")
                    &&(forwarder == 0){
                        
                        //SFX
                        audio_play_sfx(snd_window_open);
                        forwarder = 1;
                            
                        //Procurar primeiro arquivo...
                        forwarder_file = file_find_first(filename_path(games_forwarder[select_index])+"*",fa_directory);
                            
                        //Permitir procurar próximos
                        forwarder_find = 1;
                        
                        exit;
                    }
                        
                    //Iniciar máximizado/janela
                    if(windowmode == 0){
                    
                        if(fullscreen == 1)
                            boot_res = "/MAX ";
                        else
                            boot_res = "";
                    }
                    else if(windowmode == 1)
                        boot_res = "";
                    else if(windowmode == 2)
                        boot_res = "/MAX ";
                        
                    //Prioridade do processo
                    if(gamepriority == 2)
                        boot_priority = "/LOW ";
                    else if(gamepriority == 1)
                        boot_priority = "/HIGH ";
                    else
                        boot_priority = "";
                        
                    //Iniciar e suspender
                    if(games_shortcut[select_index] == 0)
                        boot_wait = "/WAIT ";
                    else
                        boot_wait = "";
            
                    //Forwarder
                    if(forwarder != 0)
                    &&(forwarder_select > 0)
                    &&(forwarder_find == 0){
                    
                        //Abrir subpasta
                        if(file_attributes(games_forwarder[select_index]+ds_map_find_value(forwarder_list,string(forwarder_select)+"_r"), fa_directory))
                        &&(forwarder_subfolder == ""){
                            
                            var _f_path = string(ds_map_find_value(forwarder_list,string(forwarder_select)+"_r"));
                            var _f_name = string(ds_map_find_value(forwarder_list,string(forwarder_select)+"_r"));
                            
                            //Salvar posição
                            games_subselect[select_index] = forwarder_select;
                            ini_open(game_save_id+"collection\\game_"+string(select_index)+".ini");
                            ini_write_string("NINTY_ENTRY","subselect",string(forwarder_select));
                            ini_close();
                            
                            //Limpar lista anterior
                            ds_map_clear(forwarder_list);
                            
                            //SFX
                            audio_play_sfx(snd_window_open);
                            
                            //Reiniciar posição e total
                            forwarder_select = 0;
                            forwarder_total = 0;
                            forwarder_listoffset = 0;
                            
                            //Lembrar que subpasta foi aberta
                            forwarder_subfolder = string_copy(_f_name,0,32)+"*";
                            
                            //Procurar primeiro arquivo dentro da subpasta de destino...
                            forwarder_subfolder_path = filename_name(_f_path)+"\\";
                            forwarder_file = file_find_first(games_forwarder[select_index]+_f_path+"\\*",fa_directory);
                                
                            //Permitir procurar próximos
                            forwarder_find = 1;
                            
                            exit;
                        }
                        else
                            boot_attach = "\""+games_forwarder[select_index]+forwarder_subfolder_path+string(ds_map_find_value(forwarder_list,string(forwarder_select)+"_r"))+"\"";
                    }
                    else
                        boot_attach = "";
                                
                    window_set_fullscreen(0);
                    audio_play_sfx(snd_launcher_startgame);
                    alarm[0] = 25;
                }   
            }  
        }
    }
}

}

//Standby
if(os_is_paused())
&&!(instance_exists(oNinny)){

    io_clear();
    
    //Pausar música
    if(audio_exists(wallpaper_song))
        audio_pause_sound(wallpaper_song);
    
    //SFX
    audio_play_sfx(snd_launcher_close);
}

/* */
/*  */
