/// @description Avançar
if!(window_has_focus())
    exit;

if(def_text < 31){
    event_user(2);
}
else{

    if(alarm[1] == -1){
    
        if(keyboard_check(vk_enter)){
        
            //Limpar teclas
            keyboard_clear(vk_enter);
            
            //Página de update
            if(update_select == 0){
            
                //Atualizar Launcher
                if(update == 1){
                
                    //Abrir browser (todo boladão)
                    url_open(oLauncher.version_url);
                    
                    //Finalizar
                    last = 1;
                    alarm[1] = 5;
                }
                //Remover jogo
                else{
                
                    //Abrir browser (todo boladão)
                    with(oLauncher)
                        event_user(7);
                    
                    //Finalizar
                    instance_destroy();
                }
            }
            //Cancelar
            else{
            
                if(update == 2)
                    last = 1;
                event_user(2);
            }
        }
        //Cancelar
        else if(keyboard_check(vk_escape))
        ||(keyboard_check(vk_backspace)){
        
            if(update == 2)
                last = 1;
            event_user(2);
        }
    }
}

