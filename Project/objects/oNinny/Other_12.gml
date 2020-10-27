/// @description Avançar (Animações)
/// @param Animações
if(alarm[0] == -1)
&&(alarm[1] == -1){

    def_text++;
    
    //Apresentação
    if(def_text == 0){
    
        def_sprite = spr_assistant_a;
        def_posx = 640;
        def_posy = 100;
        def_continuous = 0;
        def_textmod = 2; //Cima
    }
    else if(def_text == 1){
    
        def_continuous = 1; //Manter animação anterior
        def_textmod = 2; //Cima
    }
    else if(def_text == 2){
    
        def_continuous = 1; //Manter animação anterior
        def_textmod = 2; //Cima
    }   
    else if(def_text == 3){
    
        def_continuous = 1; //Manter animação anterior
        def_textmod = 2; //Cima
    }  
    //Funções
    else if(def_text == 4){

        //Highlight    
        def_highlight = 1;
        def_highlight_x1 = 310;
        def_highlight_y1 = 489;
        def_highlight_x2 = 980;
        def_highlight_y2 = 604;
            
        def_posx = 640;
        def_posy = 416;
        def_continuous = 0;
        def_textmod = 3; //Baixo
    }  
    //Lixeira
    else if(def_text == 5){
    
        //Highlight    
        def_highlight = 1;
        def_highlight_x1 = 310;
        def_highlight_y1 = 489;
        def_highlight_x2 = 428;
        def_highlight_y2 = 604;
        
        def_posx = 370;
        def_posy = 416;
        def_continuous = 0;
        def_textmod = 0; //Esquerda
    }  
    else if(def_text == 6){
    
        def_sprite = spr_assistant_b;
        def_continuous = 1; //Manter animação anterior
        def_textmod = 0; //Esquerda
    }  
    //Bloqueio de interface
    else if(def_text == 7){

        //Highlight    
        def_highlight = 1;
        def_highlight_x1 = 66;
        def_highlight_y1 = 29;
        def_highlight_x2 = 119;
        def_highlight_y2 = 85;
        
        def_sprite = spr_assistant_a;    
        def_posx = 92;
        def_posy = 152;
        def_continuous = 0;
        def_textmod = 0; //Esquerda
    } 
    else if(def_text == 8){

        def_continuous = 1; //Manter animação anterior
        def_textmod = 0; //Esquerda
    } 
    //Info/Settings
    else if(def_text == 9){

        //Highlight    
        def_highlight = 1;
        def_highlight_x1 = 642;
        def_highlight_y1 = 664;
        def_highlight_x2 = 681;
        def_highlight_y2 = 703;
        
        def_sprite = spr_assistant_a;    
        def_posx = 640;
        def_posy = 590;
        def_continuous = 0;
        def_textmod = 3; //Baixo
    }  
    else if(def_text == 10){

        //Highlight    
        def_highlight = 1;
        def_highlight_x1 = 597;
        def_highlight_y1 = 664;
        def_highlight_x2 = 636;
        def_highlight_y2 = 703;
        
        def_continuous = 1; //Manter animação anterior
        def_textmod = 3; //Baixo
    }
    //Menu de configurações
    //Pasta
    else if(def_text == 11){

        //SFX
        audio_play_sfx(snd_settings);
        
        //Alterar interface
        with(oLauncher){
        
            settingsmenu = 1;
            settingsmenu_select = 7;
        }
        
        //Highlight    
        def_highlight = 1;
        def_highlight_x1 = 344-16;
        def_highlight_y1 = 117;
        def_highlight_x2 = 934+16;
        def_highlight_y2 = 451;
        
        def_sprite = spr_assistant_a;    
        def_posx = 640;
        def_posy = 500;
        def_continuous = 0;
        def_textmod = 2; //Cima
    }  
    else if(def_text == 12){
    
        def_continuous = 1; //Manter animação anterior
    }  
    else if(def_text == 13){
    
        def_continuous = 1; //Manter animação anterior
    } 
    //Base de jogos
    else if(def_text == 14){

        //Alterar interface
        with(oLauncher)
            settingsmenu_select = 6;
        
        def_sprite = spr_assistant_a;
    } 
    //Animação wifi
    else if(def_text == 15){

        //Alterar interface
        with(oDownloader)
            downloading = 1;
            
        //Highlight    
        def_highlight = 1;
        def_highlight_x1 = 71;
        def_highlight_y1 = 29;
        def_highlight_x2 = 119;
        def_highlight_y2 = 85;
        
        def_sprite = spr_assistant_a;    
        def_posx = 92;
        def_posy = 152;
        def_continuous = 0;
        def_textmod = 0; //Esquerda
    } 
   
    else if(def_text == 16){

        //Alterar interface
        with(oLauncher)
            settingsmenu_select = 5;
        with(oDownloader)
            downloading = 0;
         
        //Highlight    
        def_highlight = 1;
        def_highlight_x1 = 344-16;
        def_highlight_y1 = 117;
        def_highlight_x2 = 934+16;
        def_highlight_y2 = 451;
           
        def_sprite = spr_assistant_b;
        def_posx = 640;
        def_posy = 500;
        def_continuous = 0;
        def_textmod = 2; //Cima
    } 
    //Prioridade dos jogos
    else if(def_text == 17){

        //Alterar interface
        with(oLauncher)
            settingsmenu_select = 4;
            
        def_sprite = spr_assistant_a;    
        def_continuous = 1;
    } 
    else if(def_text == 18){
    
        def_continuous = 1; //Manter animação anterior
    } 
    //Janela dos jogos
    else if(def_text == 19){

        //Alterar interface
        with(oLauncher)
            settingsmenu_select = 3;
            
        def_sprite = spr_assistant_a; 
    } 
    else if(def_text == 20){
    
        def_continuous = 1; //Manter animação anterior
    } 
    //Efeitos sonoros
    else if(def_text == 21){

        //Alterar interface
        with(oLauncher)
            settingsmenu_select = 2;
            
        def_sprite = spr_assistant_a;
    } 
    //Renderização da interface
    else if(def_text == 22){

        //Alterar interface
        with(oLauncher)
            settingsmenu_select = 1;
            
        def_sprite = spr_assistant_a;
    } 
    else if(def_text == 23){
    
        def_continuous = 1; //Manter animação anterior
    } 
    else if(def_text == 24){
    
        def_sprite = spr_assistant_b;
        def_continuous = 1; //Manter animação anterior
    } 
    //Idioma
    else if(def_text == 25){

        //Alterar interface
        with(oLauncher)
            settingsmenu_select = 0;
            
        def_sprite = spr_assistant_a;
    } 
    else if(def_text == 26){
    
        def_sprite = spr_assistant_b;
    } 
    //Guia
    else if(def_text == 27){
    
        //Alterar interface
        with(oLauncher)
            settingsmenu_select = 8;
            
        //Highlight    
        def_highlight = 1;
        def_highlight_x1 = 344-4;
        def_highlight_y1 = 407;
        def_highlight_x2 = 934+6;
        def_highlight_y2 = 451;
        
        def_sprite = spr_assistant_b;
        def_continuous = 0;
        def_posy = 305;
        def_textmod = 3; //Baixo
    } 
    //Discord
    else if(def_text == 28){
            
        def_highlight = 0;
        def_sprite = spr_assistant_a;
        def_continuous = 0;
        def_posy = 382;
    } 
    else if(def_text == 29){
    
        //Alterar interface
        with(oLauncher)
            settingsmenu_select = 9;
          
        //Highlight    
        def_highlight = 1;
        def_highlight_x1 = 337;
        def_highlight_y1 = 465;
        def_highlight_x2 = 949;
        def_highlight_y2 = 664;
          
        def_sprite = spr_assistant_b;
        def_continuous = 1; //Manter animação anterior
    } 
    else if(def_text == 30){

        //Alterar interface
        with(oLauncher)
            settingsmenu_select = 10;
            
        def_sprite = spr_assistant_b;
    } 
    //Atualização
    else if(def_text == 31){

        def_sprite = spr_assistant_a;
        def_posx = 640;
        def_posy = 280-40;
        def_continuous = 0;
        def_textmod = 2; //Cima
    } 
    else if(def_text == 32){

        def_sprite = spr_assistant_b;
        def_posx = 640;
        def_posy = 470;
        def_continuous = 0;
        def_textmod = 3; //Baixo
    }  
    //Remover jogo
    else if(def_text == 33){

        def_sprite = spr_assistant_a;
        def_posx = 640;
        def_posy = 280-40;
        def_continuous = 0;
        def_textmod = 2; //Baixo
    }    

    //Preparar animação
    alarm[1] = 1;
}

