/// @description Interface gráfica

//Ignorar quando suspenso
if(is_playing == 1)
    exit;

//------------- Wallpaper -------------

//Cor HUE para elementos genrais
var theme_color;
if(wallpaper_huecolor > 0)
    theme_color = make_colour_hsv(wallpaper_huecolor,255,255);
else
    theme_color = c_white;
    
//Cor HUE para seletor/cursor
var c_col_d, c_col_l;
if(wallpaper_huecursor > 0){
    
    c_col_l = make_colour_hsv(wallpaper_huecursor,wallpaper_sat1cursor,wallpaper_lum1cursor);
    c_col_d = make_colour_hsv(wallpaper_huecursor,wallpaper_sat2cursor,wallpaper_lum2cursor);
}
else{

    if(theme == 0){
    
        c_col_l = c_aqua;
        c_col_d = c_teal;
    }
    else{

        c_col_l = $f2f088;
        c_col_d = $c78c1b;    
    }
}

//Cor
if(theme == 1)
    draw_background_tiled_ext(bgr_dark,0,0,1,1,theme_color,1);
else
    draw_background_tiled_ext(bgr_light,0,0,1,1,theme_color,1);

var icon_opc;

//Customizado
if(sprite_exists(wallpaper)){
    
    //Opacidade dos icones
    if(wallpaper_opaquebuttons == 0)
        icon_opc = 12;
    else
        icon_opc = 0;
    
    //Animações
    if(alarm[10] == -1)
    &&(alarm[11] == -1){
        
        //Animação
        if(wallpaper_animframes > 1)
        &&(wallpaper_animspeed > 0){
                
            if(anim_wallpaper < wallpaper_animframes)
                anim_wallpaper += 1/wallpaper_animspeed;
            else
                anim_wallpaper = 0;
        }
        
        //Rolagem
        if(wallpaper_h_scrolling != 0)
            wp_x += wallpaper_h_scrolling;
        if(wallpaper_v_scrolling != 0)    
            wp_y += wallpaper_v_scrolling;
    
        //Clamp horizontal
        if(wp_x < -sprite_get_width(wallpaper))
            wp_x = 0;
        if(wp_x > sprite_get_width(wallpaper))
            wp_x = 0;
            
        //Clamp vertical
        if(wp_y < -sprite_get_height(wallpaper))
            wp_y = 0;
        if(wp_y > sprite_get_height(wallpaper))
            wp_y = 0;
    }
    
    //Esticado
    if(wallpaper_stretched == 1){
    
        if(window_get_fullscreen() == 1)
            draw_sprite_stretched(wallpaper,anim_wallpaper,0,-(display_get_height()-720)/2,display_get_width(),display_get_height());
        else
            draw_sprite_stretched(wallpaper,anim_wallpaper,0,0,1280,720);
    }
    else{
    
        //Tiled
        if(wallpaper_tiled == 1)
            draw_sprite_tiled(wallpaper,anim_wallpaper,wallpaper_h_offset+wp_x,wallpaper_v_offset+wp_y);
        //Normal
        else
            draw_sprite(wallpaper,anim_wallpaper,wallpaper_h_offset+wp_x,wallpaper_v_offset+wp_y);        
    }
}
else
    icon_opc = 0;

//------------- Base -------------

//Barra (Footer)
draw_sprite_ext(spr_launcher_line,theme,29,646,1,1,0,c_white,1);

//Pasta/Informações
draw_sprite_ext(spr_launcher_about,theme,1280/2,664,1,1,0,c_white,parental_fadeicons);
draw_set_font(fnt_small);

//Total de jogos
if(theme == 0)
    draw_set_colour(c_black);        
if(games_total > 0){

    draw_text_shadow(132,668,string(select_index+1)+" / "+string(games_total));
    draw_text(132,668,string_hash_to_newline(string(select_index+1)+" / "+string(games_total)));
}

//Comandos de navegação
var _ctrlinfo_offset;
if(move == 0)
    _ctrlinfo_offset = string_width(string_hash_to_newline(text_ctrl[0]));
else
    _ctrlinfo_offset = string_width(string_hash_to_newline(text_ctrl[4]));

//Controle
var _txt_gamepad;
if(gamepad_is_connected(0) == 1)
||(gamepad_is_connected(4) == 1){
    
    //GAMEPAD
    draw_sprite_ext(spr_launcher_controller,theme+2,51,660,1,1,0,c_white,1);
    _txt_gamepad = 6;
}
else{
    
    //TECLADO
    draw_sprite_ext(spr_launcher_controller,theme,51,660,1,1,0,c_white,1);
    _txt_gamepad = 0; 
}
    
//informações básicas
if(games_total > 0){
        
    //Offset
    var _txt_start, _txt_move, _spr_move;
    if(move == 1){
        
        _txt_start = 4;
        _txt_move = 3;
        _spr_move = 4;
    }
    else{
        
        _txt_start = 0; 
        _txt_move = 2;
        _spr_move = 2;
    }

    //SHIFT - Mover/ ESC - Cancelar  
    if(parental_control == 0){
                 
        draw_sprite_ext(spr_launcher_ctrlmap,theme+_txt_gamepad+_spr_move,(1222-128-string_width(string_hash_to_newline(text_ctrl[_txt_start])))-string_width(string_hash_to_newline(text_ctrl[_txt_move])),663,1,1,0,c_white,parental_fadeicons);
        draw_text_shadow((1222-128-string_width(string_hash_to_newline(text_ctrl[_txt_start])))-string_width(string_hash_to_newline(text_ctrl[_txt_move])),668,text_ctrl[_txt_move]);
        draw_text((1222-128-string_width(string_hash_to_newline(text_ctrl[_txt_start])))-string_width(string_hash_to_newline(text_ctrl[_txt_move])),668,string_hash_to_newline(text_ctrl[_txt_move]));
    }
        
    //ENTER - Iniciar/Confirmar           
    draw_sprite_ext(spr_launcher_ctrlmap,theme+_txt_gamepad,1222-string_width(string_hash_to_newline(text_ctrl[_txt_start])),663,1,1,0,c_white,1);
    draw_text_shadow(1222-string_width(string_hash_to_newline(text_ctrl[_txt_start])),668,text_ctrl[_txt_start]);
    draw_text(1222-string_width(string_hash_to_newline(text_ctrl[_txt_start])),668,string_hash_to_newline(text_ctrl[_txt_start]));
}

draw_set_colour(c_white);
draw_set_font(fnt_default);

//------------- Icones -------------

//Deletar
draw_sprite_ext(spr_launcher_icons,theme+icon_opc,322,498-(parental_offset*2),1,1,0,theme_color,parental_fadeicons);
draw_sprite_ext(spr_launcher_icons,2,322,498-(parental_offset*2),1,1,0,c_white,parental_fadeicons);

//Alterar
draw_sprite_ext(spr_launcher_icons,theme+icon_opc,430,498-(parental_offset*2),1,1,0,theme_color,parental_fadeicons);
draw_sprite_ext(spr_launcher_icons,3,430,498-(parental_offset*2),1,1,0,c_white,parental_fadeicons);
    
//Pesquisar
draw_sprite_ext(spr_launcher_icons,theme+icon_opc,538,498-(parental_offset*2),1,1,0,theme_color,parental_fadeicons);
draw_sprite_ext(spr_launcher_icons,4,538,498-(parental_offset*2),1,1,0,c_white,parental_fadeicons);

//Tema
draw_sprite_ext(spr_launcher_icons,theme+icon_opc,646,498-(parental_offset*2),1,1,0,theme_color,parental_fadeicons);
draw_sprite_ext(spr_launcher_icons,5+theme,646,498-(parental_offset*2),1,1,0,c_white,parental_fadeicons);

//Wallpaper
draw_sprite_ext(spr_launcher_icons,theme+icon_opc,754,498-(parental_offset*2),1,1,0,theme_color,parental_fadeicons);
draw_sprite_ext(spr_launcher_icons,7+theme,754,498-(parental_offset*2),1,1,0,c_white,parental_fadeicons);

//Adicionar
draw_sprite_ext(spr_launcher_icons,theme+icon_opc,862,498-(parental_offset*2),1,1,0,theme_color,parental_fadeicons);
draw_sprite_ext(spr_launcher_icons,9+theme,862,498-(parental_offset*2),1,1,0,c_white,parental_fadeicons);

//Aviso para adicionar jogos (caso não tenha nenhum)
if(games_total == 0)
    draw_sprite_ext(spr_launcher_icons,11,862,498-(parental_offset*2),1,1,0,merge_colour(c_yellow,c_orange,col_numb),parental_fadeicons);

//Aviso para atualizar jogos (caso não seja encontrado)
if(move == 0)
&&(games_total > 0)
&&(select_exists == 0)
    draw_sprite_ext(spr_launcher_icons,11,430,498-(parental_offset*2),1,1,0,merge_colour(c_yellow,c_orange,col_numb),parental_fadeicons);

//Seletor de icones
if(icon_select > -1){

    //Highlight
    is_col = merge_colour(c_col_l,c_col_d,col_numb);
    draw_sprite_ext(spr_launcher_icons,11,322+(98+10)*icon_select,498-(parental_offset*2),1,1,0,is_col,1);
    
    //Texto
    draw_set_font(fnt_small);
    draw_set_halign(fa_center);
    draw_text_shadow(322+50+(98+10)*icon_select,498+104-(parental_offset*2),text_icon[icon_select]);
    draw_text_colour(322+50+(98+10)*icon_select,498+104-(parental_offset*2),string_hash_to_newline(text_icon[icon_select]),is_col,is_col,is_col,is_col,1);
    draw_set_halign(fa_left);
    draw_set_font(fnt_default);
}

//------------- Lista de Jogos -------------

//Fundo preto (Tela de pesquisa)
if(dialog_description == text_icon[2]+":"){

    if(theme == 0)
        draw_set_colour(c_white);
    else
        draw_set_colour(c_black);
    
    draw_set_alpha(0.8);
    draw_rectangle(dialog_filterleft,-3000,dialog_filterright,720+3000,0);
    draw_set_colour(c_white);
    draw_set_alpha(1);
}

//Rolagem (de acordo com offset)
if(select_index > 1)
    offset = 502+(-276*select_index);
else
    offset = 98;

//Rolagem vertical
if(games_total > 0)
&&(move == 0)
&&(games_shortcut[select_index] == 0){

    if(offset_v < 32-6)
        offset_v += 6;
}
else
    offset_v = 0;

//Lista de jogos (Mostrar apenas oque esta na tela)
var i, i_start, i_end;
if(select_index > 1){

    i_start = select_index-2;
    i_end = select_index+3;
}
else{

    i_start = 0;
    i_end = select_index+5;
}
for(i=i_start; i<i_end; i+=1){

    var vv = 0;
    if(select_index == i)
        vv = offset_v;
                
    //Sombra
    draw_sprite(spr_launcher_thumbnail_shadow,theme,offset+(256+20)*i,194+parental_offset-vv);
    
    //Blocos vázios
    if(i > games_total-1)
    ||((move == 1)&&(i == move_origin))
        draw_sprite_ext(spr_launcher_thumbnail,theme,offset+(256+20)*i,194+parental_offset-vv,1,1,0,theme_color,1);
    //Thumbnail dos jogos
    else{
    
        if(sprite_exists(games_thumb[i]))
        &&(games_total > 0){
        
            //Animação
            if(games_animframes[i] > 1)
            &&(games_animspeed[i] > 0)
            &&(alarm[10] == -1)
            &&(alarm[11] == -1){
            
                if(anim_games[i] < games_animframes[i])
                    anim_games[i] += 1/games_animspeed[i];
                else
                    anim_games[i] = 0;
            }
            
            //Lista de pesquisa (Transparente)
            if(dialog == 2){
            
                if(select_index == i)
                    draw_set_alpha(1)
                else
                    draw_set_alpha(0.3);
            }
            draw_sprite_stretched(games_thumb[i],anim_games[i],offset+(256+20)*i,194+parental_offset-vv,256,256);
            draw_set_alpha(1);
        }
    }
}

//Seletor de jogos
if(select_index < games_total+1)
&&(games_total > 0){
        
    var _msg, _col1, _col2;
                    
    //Mover
    if(move == 1){
    
        _msg = games_title[move_origin];
        _col1 = c_yellow;
        _col2 = c_orange;    
    }
    else{
    
        //Padrão
        if(select_exists == 1){
        
            _msg = games_title[select_index];
            _col1 = c_col_l;
            _col2 = c_col_d;
        }
        //Jogo não encotrado
        else{
     
            _msg = text_notfound;
            _col1 = c_red;
            _col2 = c_maroon;
        }
    }

    //Mostrar thumbnail que esta sendo movida
    var move_offset = 0;
    if(move == 1){
    
        move_offset = 32;
        if(sprite_exists(games_thumb[move_origin])){
        
            draw_set_alpha(col_numb+0.4);
            draw_sprite_stretched(games_thumb[move_origin],0,(offset-0)+276*select_index,194+parental_offset-32,256,256);
            draw_set_alpha(1);
        }
    }
    
    //Seletor
    col = merge_colour(_col1,_col2,col_numb);
    draw_sprite_ext(spr_launcher_selector,0,(offset-10)+276*select_index,184+parental_offset-offset_v-move_offset,1,1,0,col,1);

    //Nome do jogo selecionado
    if(select_index == 0){
    
        //Primeiro da lista
        draw_text_shadow(offset-16,123+parental_offset-offset_v-move_offset,_msg);    
        draw_text_colour(offset-16,123+parental_offset-offset_v-move_offset,string_hash_to_newline(_msg),col,col,col,col,1);
    }
    else{
    
        //Todos outros
        draw_set_halign(fa_center);
        draw_text_shadow(offset+(276*select_index)+256/2,123+parental_offset-offset_v-move_offset,_msg);
        draw_text_colour(offset+(276*select_index)+256/2,123+parental_offset-offset_v-move_offset,string_hash_to_newline(_msg),col,col,col,col,1);
        draw_set_halign(fa_left);
    }
    
    //Prefixos
    if(move == 0){
    
        //Play Time
        if(games_shortcut[select_index] == 0){
        
            var _pt_offset = 0;
            if(games_playtime[select_index,0] < 1)
            &&(games_playtime[select_index,1] < 1){
            
                var _pt_hour = "--";
                var _pt_min = "--";
            }
            else{
            
                //Offset caso passe de 100 horas
                if(games_playtime[select_index,0] > 99)
                    _pt_offset = 20;
                //Offset caso passe de 1.000 horas
                if(games_playtime[select_index,0] > 999)
                    _pt_offset = 30;
            
                var _pt_hour = string_replace_all(string_format(real(games_playtime[select_index,0]),2,0)," ","0");
                var _pt_min = string_replace_all(string_format(real(games_playtime[select_index,1]),2,0)," ","0");
            }
            
            var _pt_icon = 0;
            
            //Icone de forwarder
            if(games_forwarder[select_index] != "")
                _pt_icon = 0;
            else
                _pt_icon = 1;
            
            draw_set_font(fnt_clock);
            draw_text_shadow((offset+(276*select_index)+(256/2)-18)-_pt_offset,466+parental_offset-offset_v,_pt_hour+":"+_pt_min);
            draw_text_colour((offset+(276*select_index)+(256/2)-18)-_pt_offset,466+parental_offset-offset_v,string_hash_to_newline(_pt_hour+":"+_pt_min),col,col,col,col,1);
            draw_set_font(fnt_default);
            draw_sprite_ext(spr_launcher_gameprefix,_pt_icon,(offset+(276*select_index)+(256/2)-48-18)-_pt_offset,466+parental_offset-offset_v,1,1,0,col,1);
        }
        
        //Atalho
        if(games_shortcut[select_index] == 1)
            draw_sprite_ext(spr_launcher_gameprefix,2,(offset+(276*select_index)+(256/2)-126),402+parental_offset-offset_v,1,1,0,col,1);
    }
}

//------------- Menu de Forwarder -------------

//Animação
if(forwarder == 1){

    //Abrir
    if(forwarder_fade < 1)
        forwarder_fade += 0.1;
}
else{

    //Fechar
    if(forwarder_fade > 0){
    
        //Antes de fechar...
        if(forwarder_fade == 0.1){
        
            //Limpar lista anterior
            ds_map_clear(forwarder_list);
            
            //Salvar posição
            if(forwarder_subfolder == ""){
            
                games_subselect[select_index] = forwarder_select;
                ini_open(game_save_id+"collection\\game_"+string(select_index)+".ini");
                ini_write_string("NINTY_ENTRY","subselect",string(forwarder_select));
                ini_close();
            }
                        
            //Reiniciar posição e total
            forwarder_select = 0;
            forwarder_subfolder = "";
            forwarder_subfolder_path = "";
            forwarder_total = 0;
            forwarder_listoffset = 0;
        }
        forwarder_fade -= 0.1;
    }
    else
        forwarder_fade = 0;
}

//Forwarder
if(forwarder_fade > 0){
    
    //Fundo
    if(theme == 0)
        draw_set_colour(c_white);
    else
        draw_set_colour(c_black);
    draw_set_alpha(forwarder_fade-0.3);
    draw_rectangle(-3000,-3000,1280+3000,720+3000,0);
    draw_set_colour(c_white);
    draw_sprite_ext(spr_submenu_layout,theme,1280/2,720/2-128+(128*forwarder_fade),1,1,0,theme_color,forwarder_fade);
    draw_sprite_ext(spr_submenu_line,theme,348,109-128+(128*forwarder_fade),1,1,0,c_white,forwarder_fade);
    
    //Miniatura
    if(sprite_exists(games_thumb[select_index]))
        draw_sprite_stretched_ext(games_thumb[select_index],anim_games[select_index],680,400-128+(128*forwarder_fade),256,256,c_white,forwarder_fade/9);
    
    //Titulo
    draw_set_alpha(forwarder_fade);
    draw_set_font(fnt_small);
    if(theme == 0)
        draw_set_color(c_black);
    else
        draw_set_color(c_white);
    draw_set_halign(fa_center);
    if(forwarder_subfolder == "")
        draw_text(1280/2,64-128+(128*forwarder_fade)-3,string_hash_to_newline(games_title[select_index]));
    else
        draw_text(1280/2,64-128+(128*forwarder_fade)-3,string_hash_to_newline(forwarder_subfolder));        
    draw_set_halign(fa_left);
    
    //Total
    if(forwarder_total > 0)
        draw_text(350,630-128+(128*forwarder_fade)-3,string_hash_to_newline(string(forwarder_select)+" / "+string(forwarder_total)));
    else{
    
        //Destino não localizado
        draw_text(350,630-128+(128*forwarder_fade)-3,string_hash_to_newline("--/--"));
        draw_text(350,125-128+(128*forwarder_fade),string_hash_to_newline(text_forwarder[1]));
    }
    
    //Comandos de navegação
    
    //GAMEPAD
    if(gamepad_is_connected(0) == 1)
    ||(gamepad_is_connected(4) == 1){

        //B - Fechar
        draw_sprite_ext(spr_launcher_ctrlmap,theme+10,571,622-128+(128*forwarder_fade),1,1,0,c_white,forwarder_fade);
        draw_text(571+10,627-128+(128*forwarder_fade),string_hash_to_newline(text_ctrl[1]));
            
        //A - Iniciar
        draw_sprite_ext(spr_launcher_ctrlmap,theme+6,803,622-128+(128*forwarder_fade),1,1,0,c_white,forwarder_fade);
        draw_text(803+10,627-128+(128*forwarder_fade),string_hash_to_newline(text_ctrl[0]));
    }
    //TECLADO
    else{

        //ESC - Fechar
        draw_sprite_ext(spr_launcher_ctrlmap,theme+4,571,622-128+(128*forwarder_fade),1,1,0,c_white,forwarder_fade);
        draw_text(571+10,627-128+(128*forwarder_fade),string_hash_to_newline(text_ctrl[1]));
            
        //ENTER - Iniciar
        draw_sprite_ext(spr_launcher_ctrlmap,theme,803,622-128+(128*forwarder_fade),1,1,0,c_white,forwarder_fade);
        draw_text(803+10,627-128+(128*forwarder_fade),string_hash_to_newline(text_ctrl[0]));
    }
    draw_set_color(c_white);
    
    //Lista de arquivos (16 são apresentados)
    var l;
    var l_end = clamp(forwarder_listoffset, forwarder_listoffset+15, forwarder_total+1);
    for(l=forwarder_listoffset; l<l_end; l+=1){
    
        //Seletor
        if(forwarder_select == l){
            
            draw_sprite_ext(spr_submneu_selector,theme+1,350,125+((l*32)-(forwarder_listoffset*32))-128+(128*forwarder_fade),1,1,0,c_white,forwarder_fade);
            draw_sprite_ext(spr_submneu_selector,0,350,125+((l*32)-(forwarder_listoffset*32))-128+(128*forwarder_fade),1,1,0,merge_colour(c_col_l,c_col_d,col_numb),forwarder_fade);
            draw_set_color(merge_colour(c_col_l,c_col_d,col_numb));
                
            //Extensão
            if(l > 0){
                
                //Pasta
                if(forwarder_subfolder == "")
                &&(file_attributes(games_forwarder[select_index]+ds_map_find_value(forwarder_list,string(l-1)+"_r"),fa_directory) == false)
                    draw_sprite_ext(spr_settings_icons,0,902,132+((l*32)-(forwarder_listoffset*32))-128+(128*forwarder_fade),1,1,0,merge_colour(c_col_l,c_col_d,col_numb),forwarder_fade);
                else{
                    
                    //Extensão normal
                    draw_set_halign(fa_right);
                    draw_text(350+584,125+((l*32)-(forwarder_listoffset*32))-128+(128*forwarder_fade),string_hash_to_newline(string_upper(ds_map_find_value(forwarder_list,string(l-1)+"_e"))));
                }
                draw_set_halign(fa_left);
            }
        }
            
        //Cor do tema
        if(theme == 0)
            draw_set_color(c_black);
        else
            draw_set_color(c_white);
                    
        //Iniciar sem jogo
        if(l == 0){
            
            draw_text(350,125+((l*32)-(forwarder_listoffset*32))-128+(128*forwarder_fade),string_hash_to_newline(text_forwarder[0])); 
        }
        else{
                
            //Arquivo
            if(file_attributes(games_forwarder[select_index]+ds_map_find_value(forwarder_list,string(l-1)+"_r"), fa_readonly) == false)
                draw_text(350,125+((l*32)-(forwarder_listoffset*32))-128+(128*forwarder_fade),string_hash_to_newline(string_copy(ds_map_find_value(forwarder_list,string(l-1)+"_r"),1,32)));
            else
                draw_text(350,125+((l*32)-(forwarder_listoffset*32))-128+(128*forwarder_fade),string_hash_to_newline(string_copy(string_replace(ds_map_find_value(forwarder_list,string(l-1)+"_r"),"."+ds_map_find_value(forwarder_list,string(l-1)+"_e"),""),1,32)));
            draw_set_color(c_white);
        }
    }
    
    //Resetar
    draw_set_alpha(1);
    draw_set_color(c_white);
    draw_set_font(fnt_default);
}

//------------- Menu de Configurações -------------

//Animação
if(settingsmenu == 1){

    //Abrir
    if(settingsmenu_fade < 1)
        settingsmenu_fade += 0.1;
}
else{

    //Fechar
    if(settingsmenu_fade > 0){
    
        //Antes de fechar...
        if(settingsmenu_fade == 0.1){
        
            //Salvar configurações
            event_user(4);
        }
        settingsmenu_fade -= 0.1;
    }
    else
        settingsmenu_fade = 0;
}

//Configurações
if(settingsmenu_fade > 0){
    
    //Fundo
    if(theme == 0)
        draw_set_colour(c_white);
    else
        draw_set_colour(c_black);
    draw_set_alpha(settingsmenu_fade-0.3);
    draw_rectangle(-3000,-3000,1280+3000,720+3000,0);
    draw_set_colour(c_white);
    draw_sprite_ext(spr_submenu_layout,theme,1280/2,720/2-128+(128*settingsmenu_fade),1,1,0,theme_color,settingsmenu_fade);
    draw_sprite_ext(spr_submenu_line,theme,348,109-128+(128*settingsmenu_fade),1,1,0,c_white,settingsmenu_fade);
    draw_sprite_ext(spr_submenu_line,theme,348,369-128+(128*settingsmenu_fade),1,1,0,c_white,settingsmenu_fade);    
    draw_sprite_ext(spr_submenu_line,theme,348,462-128+(128*settingsmenu_fade),1,1,0,c_white,settingsmenu_fade);
    
    //Rich Presence
    draw_sprite_ext(spr_settings_rpc,0,348,522-128+(128*settingsmenu_fade),1,1,0,c_white,settingsmenu_fade);
    if(settingsmenu_select == 10)
        draw_sprite_ext(spr_settings_rpcselector,0,348+(152*iconrpc),522-128+(128*settingsmenu_fade),1,1,0,merge_colour(c_col_l,c_col_d,col_numb),settingsmenu_fade);

    //Titulo
    draw_set_alpha(settingsmenu_fade);
    draw_set_font(fnt_small);
    if(theme == 0)
        draw_set_color(c_black);
    else
        draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_text(1280/2,64-128+(128*settingsmenu_fade)-3,string_hash_to_newline(text_settings_title));
    draw_set_halign(fa_left);
    
    //Lista de opções
    var sts;
    for(sts=0; sts<10; sts+=1){

        var sts_offset = 0;
        var sts_option = "";
        
        //Cor do tema
        if(theme == 0){
        
            sts_iconcol = c_black;
             draw_set_color(c_black);
        }
        else{
        
            sts_iconcol = c_white;
            draw_set_color(c_white);
        }
        
        if(settingsmenu_select == sts)
            sts_iconcol = merge_colour(c_col_l,c_col_d,col_numb);
                    
        //Idioma
        if(sts == 0)
            sts_option = text_settings_language[language];
        //Renderização da Interface
        else if(sts == 1)
            sts_option = text_settings_uirender[uirender];
        //Efeitos Sonoros
        else if(sts == 2)
            sts_option = text_settings_onoff[soundeffects];
        //Proporção dos jogos
        else if(sts == 3)
            sts_option = text_settings_windowmode[windowmode];
        //Prioridade dos jogos
        else if(sts == 4)
            sts_option = text_settings_gamepriority[gamepriority];
        //Checar atualizações
        else if(sts == 5)
            sts_option = text_settings_onoff[updateninty];
        //Atualizar base de dados
        else if(sts == 6)
            sts_option = text_settings_onoff[updatedatabase];
        //Pasta de Perfil
        else if(sts == 7){
            
            sts_offset = 32;
            draw_sprite_ext(spr_settings_icons,0,902,387-128+(128*settingsmenu_fade),1,1,0,sts_iconcol,settingsmenu_fade);
        }
        //Guia Interativo
        else if(sts == 8){
        
            sts_offset = 32;
            draw_sprite_ext(spr_settings_icons,1,902,418-128+(128*settingsmenu_fade),1,1,0,sts_iconcol,settingsmenu_fade);
        }
        //Discord RPC
        else if(sts == 9){
        
            sts_option = text_settings_onoff[nativerpc]+"      ";
            sts_offset = 60;
            draw_sprite_ext(spr_settings_icons,2,902,479-128+(128*settingsmenu_fade),1,1,0,sts_iconcol,settingsmenu_fade);
        }
        
        var sts_iconcol;
        
        //Seletor
        if(settingsmenu_select == sts){
        
            draw_sprite_ext(spr_submneu_selector,theme+1,350,125+sts_offset+(sts*32)-128+(128*settingsmenu_fade),1,1,0,c_white,settingsmenu_fade);
            draw_sprite_ext(spr_submneu_selector,0,350,125+sts_offset+(sts*32)-128+(128*settingsmenu_fade),1,1,0,merge_colour(c_col_l,c_col_d,col_numb),settingsmenu_fade);
            draw_set_color(merge_colour(c_col_l,c_col_d,col_numb));
        }
        
        //Opção
        draw_set_halign(fa_right);
        draw_text(350+584,125+sts_offset+(sts*32)-128+(128*settingsmenu_fade),string_hash_to_newline(sts_option));
        
        //Cor do tema
        if(theme == 0)
            draw_set_color(c_black);
        else
            draw_set_color(c_white);
        
        //Função
        draw_set_halign(fa_left);
        draw_text(350,125+sts_offset+(sts*32)-128+(128*settingsmenu_fade),string_hash_to_newline(text_settings[sts]));
    }
    
    //Resetar
    draw_set_alpha(1);
    draw_set_halign(fa_left);
    draw_set_color(c_white);
    draw_set_font(fnt_default);
}

//------------- Informação -------------

//Animação
if(infopopup == 1){

    //Abrir
    if(infopopup_fade < 1)
        infopopup_fade += 0.1;
}
else{

    //Fechar
    if(infopopup_fade > 0)
        infopopup_fade -= 0.1;
    else
        infopopup_fade = 0;
}

//Informações
if(infopopup_fade > 0){
    
    //Fundo
    if(theme == 0)
        draw_set_colour(c_white);
    else
        draw_set_colour(c_black);
    draw_set_alpha(infopopup_fade-0.3);
    draw_rectangle(-3000,-3000,1280+3000,720+3000,0);
    draw_set_colour(c_white);
    
    //Janela
    draw_sprite_ext(spr_submenu_layout,theme,1280/2,720/2-128+(128*infopopup_fade),1,1,0,theme_color,infopopup_fade);
    draw_set_alpha(1);
    if(theme == 0)
        draw_sprite_ext(spr_launcher_information,0,1280/2,720/2-128+(128*infopopup_fade),1,1,0,c_black,infopopup_fade);
    else
        draw_sprite_ext(spr_launcher_information,0,1280/2,720/2-128+(128*infopopup_fade),1,1,0,c_white,infopopup_fade);
}

//------------- Dialogo -------------


//Fundo
if(dialog_description == text_dialog[0]){

    if(theme == 0)
        draw_set_colour(c_white);
    else
        draw_set_colour(c_black);
    
    draw_set_alpha(0.9);
    draw_rectangle(dialog_filterleft,-3000,dialog_filterright,720+3000,0);
    draw_set_colour(c_white);
    draw_set_alpha(1);
}

//Alterar titulo do jogo
if(dialog != 0){

    var dg_offset;
    if(dialog == 1)
        dg_offset = 0;
    else
        dg_offset = 194;
         
    //Descrição
    draw_set_colour(merge_colour(c_col_l,c_col_d,col_numb));
    draw_set_halign(fa_center);
    draw_text(1280/2,(720/2-48)+dg_offset,string_hash_to_newline(dialog_description+" ("+string(string_length(dialog_return))+"/32)"));
        
    //Texto
    if(theme == 1)
        draw_set_colour(c_white);
    else
        draw_set_colour(c_black);
    draw_text(1280/2,(720/2)+dg_offset,string_hash_to_newline(dialog_return+dialog_inputb));
    draw_set_halign(fa_left);
    draw_set_colour(c_white);
}

//Deletando...
if(alarm[10] != -1){

    //Fundo
    if(theme == 0)
        draw_set_colour(c_white);
    else
        draw_set_colour(c_black);
    draw_set_alpha(0.7);
    draw_rectangle(-3000,-3000,1280+3000,720+3000,0);
    draw_set_alpha(1);
    draw_set_colour(c_white);
    
    //Texto
    draw_set_colour(merge_colour(c_col_l,c_col_d,col_numb));
    draw_set_halign(fa_center);
    draw_text(1280/2,(720/2)-32,string_hash_to_newline(text_deleting));
    draw_set_halign(fa_left);
    draw_set_colour(c_white);
}

//------------- Sobrepostos -------------

//Horário
var _hour;
var _min = string_replace_all(string_format(current_minute,2,0)," ","0");
draw_set_font(fnt_clock);
if(theme == 0)
    draw_set_colour(c_black);

//Hórario em AM/PM   
if(time_12h == 1){

    //AM
    if(current_hour < 12){

        if(current_hour == 0)
            _hour = string(12);
        else
            _hour = string_replace_all(string_format(current_hour,2,0)," ","0");
            
        draw_sprite_ext(spr_launcher_clock_ampm,theme,124+94,42,1,1,0,c_white,1);
    }
    //PM
    else{
    
        _hour = string_replace_all(string_format(current_hour-12,2,0)," ","0");
        draw_sprite_ext(spr_launcher_clock_ampm,theme+2,124+94,42,1,1,0,c_white,1);
    }
}
else
    _hour = string_replace_all(string_format(current_hour,2,0)," ","0");
    
//Hora/Minuto
draw_text_shadow(124,34,_hour+"  "+_min);
draw_text(124,34,string_hash_to_newline(_hour+"  "+_min));
//:
draw_text_shadow(124+39,34,clock_blink);
draw_text(124+39,34,string_hash_to_newline(+clock_blink));

draw_set_font(fnt_default);
draw_set_colour(c_white);

//Conexão
if(oDownloader.downloading == 1){

    //Animação
    if(network_anim < 11)
        network_anim += 0.25;
    else
        network_anim = 0;
        
    draw_sprite_ext(spr_launcher_connection,theme,71,37,1,1,0,c_white,1);               
    draw_sprite_ext(spr_launcher_updating,network_anim,71,37,1,1,0,c_white,1);    
}
else{

    //Parental Control
    if(parental_control == 1){
    
        if(parental_fade > 0){
        
            parental_fade -= 0.05;
            draw_sprite_ext(spr_launcher_parental,theme+2,71,35,1,1,0,c_white,parental_fade);
        }
        else
            draw_sprite_ext(spr_launcher_clock,theme,71,35,1,1,0,c_white,1);
        
    }
    else{
    
        if(point_in_rectangle(mouse_x,mouse_y,71,35,71+46,35+46))
        ||(instance_exists(oNinny))
            draw_sprite_ext(spr_launcher_parental,theme,71,35,1,1,0,c_white,parental_fade);
        else
            draw_sprite_ext(spr_launcher_clock,theme,71,35,1,1,0,c_white,parental_fade);        
    }
}

//Opções de Janela
draw_sprite_ext(spr_launcher_options,theme,1075,35,1,1,0,c_white,1);

//Filtro
if!(window_has_focus())
&&!(window_get_fullscreen())
&&(audio_exists(wallpaper_song))
&&!(instance_exists(oNinny)){

    draw_set_colour(c_black);
    draw_set_alpha(0.7);
    draw_rectangle(-3000,-3000,1280+3000,720+3000,0);
    draw_set_alpha(1);
    draw_set_colour(c_white);
}

//Cursor
draw_sprite_ext(spr_launcher_cursor,0,mouse_x,mouse_y,1,1,0,merge_colour(c_col_l,c_col_d,col_numb),1);
if((mouse_check_button(mb_right))
||(mouse_check_button(mb_middle)))
&&!(window_get_fullscreen()){

    draw_rectangle_colour(0,0,1280,720,merge_colour(c_col_l,c_col_d,col_numb),merge_colour(c_col_d,c_col_l,col_numb),merge_colour(c_col_l,c_col_d,col_numb),merge_colour(c_col_d,c_col_l,col_numb),1);
    draw_rectangle_colour(1,1,1280-1,720-1,merge_colour(c_col_l,c_col_d,col_numb),merge_colour(c_col_d,c_col_l,col_numb),merge_colour(c_col_l,c_col_d,col_numb),merge_colour(c_col_d,c_col_l,col_numb),1);
    draw_rectangle_colour(2,2,1280-2,720-2,merge_colour(c_col_l,c_col_d,col_numb),merge_colour(c_col_d,c_col_l,col_numb),merge_colour(c_col_l,c_col_d,col_numb),merge_colour(c_col_d,c_col_l,col_numb),1);
    draw_rectangle_colour(3,3,1280-3,720-3,merge_colour(c_col_l,c_col_d,col_numb),merge_colour(c_col_d,c_col_l,col_numb),merge_colour(c_col_l,c_col_d,col_numb),merge_colour(c_col_d,c_col_l,col_numb),1);
    draw_rectangle_colour(4,4,1280-4,720-4,merge_colour(c_col_l,c_col_d,col_numb),merge_colour(c_col_d,c_col_l,col_numb),merge_colour(c_col_l,c_col_d,col_numb),merge_colour(c_col_d,c_col_l,col_numb),1);
    draw_rectangle_colour(5,5,1280-5,720-5,merge_colour(c_col_l,c_col_d,col_numb),merge_colour(c_col_d,c_col_l,col_numb),merge_colour(c_col_l,c_col_d,col_numb),merge_colour(c_col_d,c_col_l,col_numb),1);
}

