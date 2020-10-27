/// @description Animação (Out)
/// @param Out
if(scale > 0)
&&(def_continuous == 0){

  scale -= 0.20;
  alarm[1] = 1;
}
else{

    //Destruir
    if(last == 1){
    
        //Alterar interface
        with(oLauncher){
            
            settingsmenu = 0;
            settingsmenu_select = 7;
        
            //Lembrar que tour já foi iniciado automático
            ini_open(game_save_id+"config.ini")
            ini_write_real("NINTY_CONFIG","helptour",help_tour);
            ini_close();       
        }
        
        instance_destroy();
        exit;
    }
    
    //Resetar
    if(def_continuous == 0)
        scale = 0;
    textanim = 0;
    image_index = 0;
    image_speed = 0;
    
    //Carregar predefinições para exibir
    sprite_index = def_sprite;
    show_text = def_text;
    show_posx = def_posx;
    show_posy = def_posy;
    show_textmod = def_textmod;
    show_highlight_x1 = def_highlight_x1;
    show_highlight_y1 = def_highlight_y1;
    show_highlight_x2 = def_highlight_x2;
    show_highlight_y2 = def_highlight_y2;

    //Direita
    if(def_textmod == 1){
        
        show_textx = def_posx-64;
        show_texty = def_posy;
    }
    //Cima
    else if(def_textmod == 2){
    
        show_textx = def_posx;
        show_texty = def_posy+64;
    }
    //Baixo
    else if(def_textmod == 3){
    
        show_textx = def_posx;
        show_texty = def_posy-64;
    }
    //Esquerda
    else{
    
        show_textx = def_posx+64;
        show_texty = def_posy;
    }
    
    //Próxima animação
    start = 1;
    alarm[0] = 10;
    alarm[1] = -1;
}

