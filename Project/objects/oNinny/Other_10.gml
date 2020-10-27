with (other) {
///Desenho

//Highlight
if(def_highlight == 1){

    draw_set_alpha(0.7);
    draw_set_color(c_black);
    draw_rectangle(0,-3000,def_highlight_x1-1,720+3000,0); //Esquerda
    draw_rectangle(def_highlight_x1,-3000,def_highlight_x2,def_highlight_y1,0); //Cima
    draw_rectangle(def_highlight_x2+1,-3000,1280,720+3000,0); //Direita
    draw_rectangle(def_highlight_x1,def_highlight_y2,def_highlight_x2,720+3000,0); //Baixa
    draw_set_color(c_white);
    draw_set_alpha(1);
}

//Atualização/Remover jogo
if(update > 0)
&&(show_text > 30){

    draw_set_alpha(0.85);
    draw_set_color(c_black);
    draw_rectangle(0,-3000,1280,720+3000,0);
    draw_set_color(c_white);
    draw_set_alpha(1);

    //Opções
    if(show_text == 31)
    ||(show_text == 33){

        if(keyboard_check_pressed(vk_up))
        ||(keyboard_check_pressed(vk_down)){
            
            update_select =! update_select;
            
            //SFX
            audio_play_sfx(snd_window_open);
        }
        
        var uptxt1, uptxt2;
        //Remover jogo
        if(update == 2){
        
            upcol = merge_colour(c_orange,c_red,oLauncher.col_numb);
            uptxt1 = oLauncher.text_remove[0];
            uptxt2 = oLauncher.text_remove[1];
        }
        //Atualizar launcher
        else{
        
            upcol = merge_colour(c_olive,c_yellow,oLauncher.col_numb);
            uptxt1 = oLauncher.text_update[0];
            uptxt2 = oLauncher.text_update[1];
        }
            
        //Seletor
        draw_sprite_ext(spr_submneu_selector,oLauncher.theme+1,350,470-40+(update_select*43),1,1,0,c_white,1);
        draw_sprite_ext(spr_submneu_selector,0,350,470-40+(update_select*43),1,1,0,upcol,1);
        
        //Texto
        draw_set_color(upcol);
        draw_set_font(fnt_small);
        draw_set_halign(fa_center);
        if(update_select != 0)
            draw_set_color(c_white);
        draw_text(645,470-40+(0*43),string_hash_to_newline(uptxt1));
        draw_set_color(c_white);
        draw_text(645,470-40+(1*43),string_hash_to_newline(uptxt2));
        draw_set_halign(fa_left);
        draw_set_font(fnt_default);
    }
}

//Dialogo
if(textanim > 0){
    
    draw_set_alpha(scale);
    draw_set_font(fnt_small);
    draw_set_color(c_black);
    draw_set_alpha(0.7);
    
    var _width, _height;
    _width = string_width(string_hash_to_newline(string_copy(oLauncher.guide[show_text],0,textanim)));
    _height = string_height(string_hash_to_newline(string_copy(oLauncher.guide[show_text],0,textanim)));
    
    //Direita
    if(show_textmod == 1){
       
        draw_rectangle(show_textx-8-_width, show_texty-8-(_height/2), show_textx+8, show_texty+8+(_height/2), 0);
        draw_set_halign(fa_right);
        draw_set_valign(fa_middle);
    }
    //Cima
    else if(show_textmod == 2){
    
        draw_rectangle(show_textx-8-(_width/2), show_texty-8, show_textx+8+(_width/2), show_texty+8+_height, 0);
        draw_set_halign(fa_center);
        draw_set_valign(fa_top);
    }
    //Baixo
    else if(show_textmod == 3){

        draw_rectangle(show_textx-8-(_width/2), show_texty-8-_height, show_textx+8+(_width/2), show_texty+8, 0);    
        draw_set_halign(fa_center);
        draw_set_valign(fa_bottom);
    }
    //Esquerda
    else{
    
        draw_rectangle(show_textx-8, show_texty-8-(_height/2), show_textx+8+_width, show_texty+8+(_height/2), 0);
        draw_set_halign(fa_left);
        draw_set_valign(fa_middle);
    }
    
    draw_set_color(c_white);
    draw_set_alpha(1);
    draw_text(show_textx,show_texty,string_hash_to_newline(string_copy(oLauncher.guide[show_text],0,textanim)));
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_font(fnt_default);
}

//Ninny
draw_sprite_ext(sprite_index,image_index,show_posx,show_posy,scale,scale,0,c_white,1);

}
