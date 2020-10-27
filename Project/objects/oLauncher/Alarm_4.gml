/// @description Definir fullscreen

//Fullscreen
window_set_fullscreen(fullscreen);

if(fullscreen == 0){

    //Recuperar posição/tamanho
    window_set_position(temp_x,temp_y);
    window_set_size(temp_w,temp_h);
    
    //Centralizar
    //alarm[3] = 2;
}
else
    window_set_position(-4000,-4000);

