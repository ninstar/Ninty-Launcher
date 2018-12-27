///find_predefined_game(name,index)
forwarder_openexplorer = 0;
games_forwarder[argument1] = "";
games_shortcut[argument1] = 0;
if(file_exists_fmns(game_save_id+"network\database.ini"))
&&(os_is_network_connected()){

    var t, p, _url, _total;
    
    //Váriavel de retorno
    ini_open(game_save_id+"network\database.ini");
    _url = ini_read_string("NINTY_TITLE_MASTER","url",default_dburl);
    _total = real(ini_read_string("NINTY_TITLE_MASTER","total","0"));
    ini_close();
    
    //Primeiro checar nome do caminho (evita confudir executaveis com nomes iguais)
    for(t=1; t<_total; t+=1){
        
        var _title, _thumb, _tagA, _tagB, _tagC, _tagD, _tagE, _tagF, _forward, _shortcut;

        ini_open(game_save_id+"network\database.ini");
        _forward = ini_read_real("NINTY_TITLE_"+string(t),"forward",0);
        _shortcut = ini_read_real("NINTY_TITLE_"+string(t),"shortcut",0);
        _title = ini_read_string("NINTY_TITLE_"+string(t),"title","");
        _thumb = ini_read_string("NINTY_TITLE_"+string(t),"thumb","");
        _tagA = ini_read_string("NINTY_TITLE_"+string(t),"tagA","");
        _tagB = ini_read_string("NINTY_TITLE_"+string(t),"tagB","");
        _tagC = ini_read_string("NINTY_TITLE_"+string(t),"tagC","");
        _tagD = ini_read_string("NINTY_TITLE_"+string(t),"tagD","");
        _tagD = ini_read_string("NINTY_TITLE_"+string(t),"tagD","");
        _tagE = ini_read_string("NINTY_TITLE_"+string(t),"tagE","");
        _tagF = ini_read_string("NINTY_TITLE_"+string(t),"tagF","");
        ini_close();

        if(string_pos(string_lower(_tagA),string_lower(filename_path(argument0))))
        ||(string_pos(string_lower(_tagB),string_lower(filename_path(argument0))))
        ||(string_pos(string_lower(_tagC),string_lower(filename_path(argument0))))
        ||(string_pos(string_lower(_tagD),string_lower(filename_path(argument0))))
        ||(string_pos(string_lower(_tagE),string_lower(filename_path(argument0))))
        ||(string_pos(string_lower(_tagF),string_lower(filename_path(argument0)))){
            
            games_title[argument1] = _title;
            games_shortcut[argument1] = real(_shortcut);
            forwarder_openexplorer = _forward;
            async_thumbnail = games_total;
            return _url+_thumb;
            break;
        };
    };

    //Depois checar nome do arquivo
    for(p=1; p<_total; p+=1){
        
        var _title, _thumb, _tagA, _tagB, _tagC, _tagD, _tagE, _tagF, _forward, _shortcut;
    
        ini_open(game_save_id+"network\database.ini");
        _forward = ini_read_real("NINTY_TITLE_"+string(p),"forward",0);
        _shortcut = ini_read_real("NINTY_TITLE_"+string(p),"shortcut",0);
        _title = ini_read_string("NINTY_TITLE_"+string(p),"title","");
        _thumb = ini_read_string("NINTY_TITLE_"+string(p),"thumb","");
        _tagA = ini_read_string("NINTY_TITLE_"+string(p),"tagA","");
        _tagB = ini_read_string("NINTY_TITLE_"+string(p),"tagB","");
        _tagC = ini_read_string("NINTY_TITLE_"+string(p),"tagC","");
        _tagD = ini_read_string("NINTY_TITLE_"+string(p),"tagD","");
        _tagD = ini_read_string("NINTY_TITLE_"+string(p),"tagD","");
        _tagE = ini_read_string("NINTY_TITLE_"+string(t),"tagE","");
        _tagF = ini_read_string("NINTY_TITLE_"+string(t),"tagF","");
        ini_close();
        
        //Checar nome do caminho (evita confudir executaveis com nomes iguais)
        if(string_lower(filename_name(argument0)) == string_lower(_tagA))
        ||(string_lower(filename_name(argument0)) == string_lower(_tagB))
        ||(string_lower(filename_name(argument0)) == string_lower(_tagC))
        ||(string_lower(filename_name(argument0)) == string_lower(_tagD))
        ||(string_lower(filename_name(argument0)) == string_lower(_tagE))
        ||(string_lower(filename_name(argument0)) == string_lower(_tagF)){
        
            games_title[argument1] = _title;
            games_shortcut[argument1] = real(_shortcut);
            forwarder_openexplorer = _forward;
            async_thumbnail = games_total;
            return _url+_thumb;
            break;
        };
    };
};
return "";
