///find_predefined_game(name,index)
if(autotitle_total > 1){

    for (t=1; t<autotitle_total; t+=1){
        
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
        
        //Checar
        if(argument0 == _tagA)
        ||(argument0 == _tagB)
        ||(argument0 == _tagC)
        ||(argument0 == _tagD){
          
            games_title[argument1] = _title;
            return assets_dir+"thumbnails\"+_thumb;  
        };
        else
            return "";
    };
};
