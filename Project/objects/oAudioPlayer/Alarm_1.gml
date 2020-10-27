/// @description Tocar música
if(audio_exists(oLauncher.wallpaper_song))
    audio_play_sound(oLauncher.wallpaper_song,0,1);
instance_destroy();

