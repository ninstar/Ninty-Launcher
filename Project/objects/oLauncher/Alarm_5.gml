/// @description Nova update?

//Ler informações
ini_open(game_save_id+"network\\NETWORK.cfg");
version_new = ini_read_string("UPDATE","version","0");
version_url = ini_read_string("UPDATE","page","https://");
ini_close();
        
//Se for nova versão...
if(version < version_new)
&&(!instance_exists(oNinny)){
        
    //Versões em texto para Ninny
    vold = string_copy(string(version),1,1)+"."+string_copy(string(version),2,1)+"."+string_copy(string(version),3,1);
    vnew = string_copy(string(version_new),1,1)+"."+string_copy(string(version_new),2,1)+"."+string_copy(string(version_new),3,1);
    event_user(3);
    
    //Ninny avisa
    with(instance_create(0,0,oNinny)){
            
        update = 1;
        def_text = 30;
        event_user(2);
    }
}

