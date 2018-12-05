///get_anim_speed(filename,index)

//Sintaxe: imagem_anim00_speed00.png

//Determinar velocidade de animação
if(string_pos("_speed",filename_name(argument0)) != 0){

    return real(string_digits(string_copy(filename_name(argument0),string_pos("_speed",filename_name(argument0))+5,3)));
};
else{
    return 0;
};
