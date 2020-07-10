///get_anim_frames(filename,index)

//Sintaxe: imagem_anim00_speed00.png

//Determinar quantidade de frames
if(string_pos("_anim",filename_name(argument0)) != 0){

    return real(string_digits(string_copy(filename_name(argument0),string_pos("_anim",filename_name(argument0))+4,3)));
};
else{
    return 1;
};
