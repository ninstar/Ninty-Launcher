/// @description Baixar...

//1. Baixar  "NETWORK.cfg"
if(ds_map_find_value(async_load,"id") == async_redirect){

    //Se download finalizar (0) ou falhar (-1)...
    if(ds_map_find_value(async_load,"status") < 1){
    
        //Finalizado
        downloading = 0;
        
        //Ler dados
        ini_open(game_save_id+"network\\NETWORK.cfg");
        global.redirect_about = ini_read_string("URL","page","hpps://");
        global.redirect_appdb = ini_read_string("REDIRECT","appdb","hpps://");
        ini_close();
        
        //Buscar por "appdb.ini"
        if(os_is_network_connected())
        &&(oLauncher.updatedatabase == 1){
        
            downloading = 1;
            async_appdb = http_get_file(global.redirect_appdb,game_save_id+"network\\appdb.ini");
        }
        else{
        
            //Preparar pop-up no launcher
            with(oLauncher){
                if(updateninty == 1)
                    alarm[5] = 15;
            }
        }
    }
    //Ainda baixando...
    else
        downloading = 1;
}

//2. Baixar "appdb.ini" e "updatelog.ini"
if(ds_map_find_value(async_load,"id") == async_appdb){

    //Se download finalizar...
    if(ds_map_find_value(async_load,"status") < 1){
    
        //Finalizado
        downloading = 0;
        
        //Preparar pop-up no launcher
        with(oLauncher){
            if(updateninty == 1)
                alarm[5] = 15;
        }
    }
    else
        downloading = 1;
}

