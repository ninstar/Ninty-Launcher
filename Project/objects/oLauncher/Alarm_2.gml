/// @description Retomar launcher
io_clear();

//Tirar do modo suspenso
is_playing = 0;
draw_enable_drawevent(1);

//Determinar tempo de jogo
var t, _date, _hour, _minute;
_date = floor(date_minute_span(time_start,date_current_datetime()));
_hour = real(games_playtime[select_index,0]);
_minute = real(games_playtime[select_index,1]);
for(t = 0; t < _date; t += 1){

    //Minuto
    if(_minute < 60)
        _minute++;
    //Hora
    else{
    
        _minute = 0;
        _hour++;  
    }
}

//Incrementar
games_playtime[select_index,0] = string(clamp(_hour,0,9999));
games_playtime[select_index,1] = string(clamp(_minute,0,59));

//Salvar no arquivo
ini_open(game_save_id+"collection\\game_"+string(select_index)+".ini");
ini_write_string("NINTY_ENTRY","0",base64_encode(games_playtime[select_index,0]));
ini_write_string("NINTY_ENTRY","1",base64_encode(games_playtime[select_index,1]));
ini_close();

//Reiniciar animações
wp_x = 0;
wp_y = 0;

//SFX
if(soundeffects == 1)
    audio_play_sfx(snd_launcher_open);

//Restaurar janela
window_command_run(window_command_restore);

//Recuperar posição/tamanho
alarm[4] = 2;

//Deletar .BAT
file_delete(game_save_id+"\\gameboot.bat");

//Re-carregar assets (Lista, Thumbnails e Wallpaper)
event_user(1);

//Limpar inputs
io_clear();
delay = 15;

//Atualizar RPC
event_user(0);

