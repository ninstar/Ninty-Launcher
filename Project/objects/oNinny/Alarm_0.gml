/// @description Animação (In)
/// @param In
if(scale < 1){

  scale += 0.10;
  alarm[0] = 1;
}
else{

    scale = 1;
    
    //Texto ~ Fala
    if(textanim < string_length(oLauncher.guide[show_text])){
        

        //SFX
        if!(audio_is_playing(snd_ninny))
            audio_play_sfx(snd_ninny);
            
        //Animar Ninny
        if(image_index < image_number)
            image_index++;
        else
            image_index = 0;
        
        //Animar texto
        textanim++;
    
        //Próximo frame...
        alarm[0] = 2;
    }
    else{
        
        //Animação blink
        if(sprite_index == spr_assistant_a){
            
            sprite_index = spr_assistant_c;
            image_speed = 0.25;
        }
        else
            image_index = 0;
    
        //Ultimo dialogo
        if(def_text == 30)
        ||(def_text == 32)
            last = 1;
        
        //Parar
        alarm[0] = -1;
        start = 0;
    }
}

