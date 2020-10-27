/// @description Descarregar assets (RAM)
/// @param RAM

//Deletar Wallpaper
if(sprite_exists(wallpaper))
    sprite_delete(wallpaper);

//Lista
var i;
for(i=0; i<games_total; i+=1){
    
    //Deketar thumbnail
    if(sprite_exists(games_thumb[i]))
        sprite_delete(games_thumb[i]);
}

//Descarregar música
audio_stop_sound(wallpaper_song);
audio_destroy_stream(wallpaper_song);