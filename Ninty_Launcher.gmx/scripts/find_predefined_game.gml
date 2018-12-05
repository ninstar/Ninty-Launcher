///find_predefined_game(name,index)
if(autotitle_total > 1){

    var t, p;
    
    //Váriavel de retorno
    var _rtn = "";
    
    //Primeiro checar nome do caminho (evita confudir executaveis com nomes iguais)
    for(t=1; t<autotitle_total; t+=1){
        
        var _title, _thumb, _tagA, _tagB, _tagC, _tagD;

        ini_open(assets_dir+"thumbnails\_titles.ini");
        _title = ini_read_string("NINTY_TITLE_"+string(t),"title","");
        _thumb = ini_read_string("NINTY_TITLE_"+string(t),"thumb","");
        _tagA = ini_read_string("NINTY_TITLE_"+string(t),"tagA","");
        _tagB = ini_read_string("NINTY_TITLE_"+string(t),"tagB","");
        _tagC = ini_read_string("NINTY_TITLE_"+string(t),"tagC","");
        _tagD = ini_read_string("NINTY_TITLE_"+string(t),"tagD","");
        _tagD = ini_read_string("NINTY_TITLE_"+string(t),"tagD","");
        ini_close();

        if(string_pos(_tagA,filename_path(argument0)))
        ||(string_pos(_tagB,filename_path(argument0)))
        ||(string_pos(_tagC,filename_path(argument0)))
        ||(string_pos(_tagD,filename_path(argument0))){
          
            games_title[argument1] = _title;
            return assets_dir+"thumbnails\"+_thumb;
            break;
        };
    };

    //Depois checar nome do arquivo
    for(p=1; p<autotitle_total; p+=1){
        
        var _title, _thumb, _tagA, _tagB, _tagC, _tagD;
    
        ini_open(assets_dir+"thumbnails\_titles.ini");
        _title = ini_read_string("NINTY_TITLE_"+string(p),"title","");
        _thumb = ini_read_string("NINTY_TITLE_"+string(p),"thumb","");
        _tagA = ini_read_string("NINTY_TITLE_"+string(p),"tagA","");
        _tagB = ini_read_string("NINTY_TITLE_"+string(p),"tagB","");
        _tagC = ini_read_string("NINTY_TITLE_"+string(p),"tagC","");
        _tagD = ini_read_string("NINTY_TITLE_"+string(p),"tagD","");
        _tagD = ini_read_string("NINTY_TITLE_"+string(p),"tagD","");
        ini_close();
        
        //Checar nome do caminho (evita confudir executaveis com nomes iguais)
        if(filename_name(argument0) == _tagA)
        ||(filename_name(argument0) == _tagB)
        ||(filename_name(argument0) == _tagC)
        ||(filename_name(argument0) == _tagD){
          
            games_title[argument1] = _title;
            return assets_dir+"thumbnails\"+_thumb;
            break;
        };
    };
};
return "";
//return _rtb;
/*    for (t=1; t<autotitle_total; t+=1){
        
        var _title, _thumb, _tagA, _tagB, _tagC, _tagD;
        
        //Carregar
        ini_open(assets_dir+"thumbnails\_titles.ini");
        _title = ini_read_string("NINTY_TITLE_"+string(t),"title","");
        _thumb = ini_read_string("NINTY_TITLE_"+string(t),"thumb","");
        _tagA = ini_read_string("NINTY_TITLE_"+string(t),"tagA","");
        _tagB = ini_read_string("NINTY_TITLE_"+string(t),"tagB","");
        _tagC = ini_read_string("NINTY_TITLE_"+string(t),"tagC","");
        _tagD = ini_read_string("NINTY_TITLE_"+string(t),"tagD","");
        _tagD = ini_read_string("NINTY_TITLE_"+string(t),"tagD","");
        ini_close();
        
        //Checar nome do caminho (evita confudir executaveis com nomes iguais)
        if((string_pos(_tagA,filename_path(argument0)))
        ||(string_pos(_tagB,filename_path(argument0)))
        ||(string_pos(_tagC,filename_path(argument0)))
        ||(string_pos(_tagD,filename_path(argument0))))
        //Checar nome do arquivo
        ||((filename_name(argument0) == _tagA)
        ||(filename_name(argument0) == _tagB)
        ||(filename_name(argument0) == _tagC)
        ||(filename_name(argument0) == _tagD)){
          
            games_title[argument1] = _title;
            return assets_dir+"thumbnails\"+_thumb;  
        };
        else
            return "";
    };
