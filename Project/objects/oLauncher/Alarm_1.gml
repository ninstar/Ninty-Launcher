/// @description Iniciar jogo
io_clear();

//Se launcher precisar ser suspenso...
if(boot_wait != ""){

    //Descarregar assets (RAM)
    event_user(2);
    
    //Após jogo finalizado...
    alarm[2] = 5;
}

//Minimizar janela
window_command_run(window_command_minimize);
    
//Executar .BAT (E aguardar execução ser finalizada...)
ExecuteShell("\""+game_save_id+"gameboot.bat\"",1,1);

