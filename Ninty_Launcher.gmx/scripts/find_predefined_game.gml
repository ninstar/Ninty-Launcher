///find_predefined_game(name,index)
if(file_exists_fmns(assets_dir+"thumbnails\_titles.ini")){
show_message("BB")
    var t, p, _total;
    
    //Váriavel de retorno
    ini_open(assets_dir+"thumbnails\_titles.ini");
    _total = real(ini_read_string("NINTY_TITLE_MASTER","total","0"));
    ini_close();
    
    //Primeiro checar nome do caminho (evita confudir executaveis com nomes iguais)
    for(t=1; t<70; t+=1){
        
        var _title, _thumb, _tagA, _tagB, _tagC, _tagD, _forward;

        ini_open(assets_dir+"thumbnails\_titles.ini");
        _title = ini_read_string("NINTY_TITLE_"+string(t),"title","");
        _thumb = ini_read_string("NINTY_TITLE_"+string(t),"thumb","");
        _tagA = ini_read_string("NINTY_TITLE_"+string(t),"tagA","");
        _tagB = ini_read_string("NINTY_TITLE_"+string(t),"tagB","");
        _tagC = ini_read_string("NINTY_TITLE_"+string(t),"tagC","");
        _tagD = ini_read_string("NINTY_TITLE_"+string(t),"tagD","");
        _tagD = ini_read_string("NINTY_TITLE_"+string(t),"tagD","");
        _forward = ini_read_string("NINTY_TITLE_"+string(t),"forward","0");
        ini_close();

        if(string_pos(_tagA,filename_path(argument0)))
        ||(string_pos(_tagB,filename_path(argument0)))
        ||(string_pos(_tagC,filename_path(argument0)))
        ||(string_pos(_tagD,filename_path(argument0))){
          
            games_title[argument1] = _title;
            games_forwarder[argument1] = 0;
            
            if(_forward == "0")
                forwarder_openexplorer = 0;
            else
                forwarder_openexplorer = 1;
            
            games_forward[argument1] = _title;
            
            show_message("BB")
            return assets_dir+"thumbnails\"+_thumb;
            break;
        };
    };

    //Depois checar nome do arquivo
    for(p=1; p<_total; p+=1){
        
        var _title, _thumb, _tagA, _tagB, _tagC, _tagD, _forward;
    
        ini_open(assets_dir+"thumbnails\_titles.ini");
        _title = ini_read_string("NINTY_TITLE_"+string(p),"title","");
        _thumb = ini_read_string("NINTY_TITLE_"+string(p),"thumb","");
        _tagA = ini_read_string("NINTY_TITLE_"+string(p),"tagA","");
        _tagB = ini_read_string("NINTY_TITLE_"+string(p),"tagB","");
        _tagC = ini_read_string("NINTY_TITLE_"+string(p),"tagC","");
        _tagD = ini_read_string("NINTY_TITLE_"+string(p),"tagD","");
        _tagD = ini_read_string("NINTY_TITLE_"+string(p),"tagD","");
        _forward = ini_read_string("NINTY_TITLE_"+string(t),"forward","0");
        ini_close();
        
        //Checar nome do caminho (evita confudir executaveis com nomes iguais)
        if(filename_name(argument0) == _tagA)
        ||(filename_name(argument0) == _tagB)
        ||(filename_name(argument0) == _tagC)
        ||(filename_name(argument0) == _tagD){
          
            games_title[argument1] = _title;
            games_forwarder[argument1] = 0;
            
            if(_forward == "0")
                forwarder_openexplorer = 0;
            else
                forwarder_openexplorer = 1;
            
            games_forward[argument1] = _title;
            
            show_message("AA")
            return assets_dir+"thumbnails\"+_thumb;
            break;
        };
    };
};
else{

    games_forwarder[argument1] = "";
    forwarder_openexplorer = 0;
    return "";
};

