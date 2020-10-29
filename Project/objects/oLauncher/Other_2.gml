/// @description Carregar definições
gml_release_mode(1);
launched = 0;
async_thumbnail = -1; //<[Número do icone na base de dados]

//Versão
version = 195;
version_string = "1.9.5";
version_new = 0; //< Essa é apenas para comparação
version_url = "https://";

//Versões em texto para dialogo da Ninny
vold = "0.0.0";
vnew = "0.0.0";

//SFXs
audio_group_load(sound_effects);

//Centralizar janela
alarm[3] = 2;

//Configurações do Launcher
ini_open(game_save_id+"config.ini");
fullscreen = ini_read_real("NINTY_CONFIG","fullscreen",0);
select_index = ini_read_real("NINTY_CONFIG","position",0);
parental_control = ini_read_real("NINTY_CONFIG","parental",0);
help_tour = ini_read_real("NINTY_CONFIG","helptour",0);
language = ini_read_real("NINTY_CONFIG","language",0);
uirender = ini_read_real("NINTY_CONFIG","uirender",0);
soundeffects = ini_read_real("NINTY_CONFIG","soundeffects",1);
windowmode = ini_read_real("NINTY_CONFIG","windowmode",0);
gamepriority = ini_read_real("NINTY_CONFIG","gamepriority",0);
updateninty = ini_read_real("NINTY_CONFIG","updateninty",1);
updatedatabase = ini_read_real("NINTY_CONFIG","updatedatabase",1);
nativerpc = ini_read_real("NINTY_CONFIG","nativerpc",1);
iconrpc = ini_read_real("NINTY_CONFIG","iconrpc",2);
time_12h = ini_read_real("NINTY_CONFIG","clockmode",0);
ini_close();

//Idioma
event_user(3);

//Display
event_user(6);

//Definir fullscreen
alarm[4] = 6;

//Volume dos SFXs
audio_group_set_gain(sound_effects,soundeffects,0);

//Carregar assets
event_user(1);

//Impedir seletor de começar fora da lista
if(select_index > games_total-1){

    if(games_total == 0)
        select_index = 0
    else
        select_index = games_total-1;
}

//Rich Presence
if(nativerpc == 1){

    InitDiscord("518643988778057729");
    
    //Atualizar RPC
    event_user(0);
}

//Guia
if(help_tour == 0){

    help_tour = 1;
    with(instance_create(0,0,oNinny))
        event_user(2);
}

//SFX
if(soundeffects == 1)
    audio_play_sfx(snd_launcher_open);

