/// @description find_predefined_game(name,index)
/// @param name
/// @param index
function find_game(argument0, argument1) {
	forwarder_openexplorer = 0;
	games_forwarder[argument1] = "";
	games_shortcut[argument1] = 0;
	games_animframes[argument1] = 0;
	games_animspeed[argument1] = 0;
            
	if(file_exists(game_save_id+"network\\appdb.ini"))
	&&(os_is_network_connected()){

	    var t, p, _url, _total;
    
	    //Váriavel de retorno
	    ini_open(game_save_id+"network\\appdb.ini");
	    _url = ini_read_string("BASE","url","https://");
	    _total = real(ini_read_string("BASE","total","0"));
	    ini_close();
    
	    //Primeiro checar nome do caminho (evita confudir executaveis com nomes iguais)
	    for(t=1; t<_total+1; t+=1){
        
	        var _title, _tagA, _tagB, _tagC, _tagD, _tagE, _tagF, _forward, _shortcut, _animframes, _animspeed;

	        ini_open(game_save_id+"network\\appdb.ini");
	        _forward = ini_read_real(string(t),"forward",0);
	        _shortcut = ini_read_real(string(t),"shortcut",0);
	        _animframes = ini_read_real(string(t),"animframes",0);
	        _animspeed = ini_read_real(string(t),"animspeed",0);
	        _title = ini_read_string(string(t),"title","");
	        _tagA = ini_read_string(string(t),"tagA","");
	        _tagB = ini_read_string(string(t),"tagB","");
	        _tagC = ini_read_string(string(t),"tagC","");
	        _tagD = ini_read_string(string(t),"tagD","");
	        _tagD = ini_read_string(string(t),"tagD","");
	        _tagE = ini_read_string(string(t),"tagE","");
	        _tagF = ini_read_string(string(t),"tagF","");
	        ini_close();

	        if(string_pos(string_lower(_tagA),string_lower(filename_path(argument0))))
	        ||(string_pos(string_lower(_tagB),string_lower(filename_path(argument0))))
	        ||(string_pos(string_lower(_tagC),string_lower(filename_path(argument0))))
	        ||(string_pos(string_lower(_tagD),string_lower(filename_path(argument0))))
	        ||(string_pos(string_lower(_tagE),string_lower(filename_path(argument0))))
	        ||(string_pos(string_lower(_tagF),string_lower(filename_path(argument0)))){
            
	            //Titulo
	            games_title[argument1] = _title;
            
	            //Configurações
	            games_shortcut[argument1] = real(_shortcut);
	            forwarder_openexplorer = _forward;
            
	            //Animação
	            games_animframes[argument1] = _animframes;
	            games_animspeed[argument1] = _animframes;
                  
	            //Lembrar posição da imagem na lista para mover depois
	            async_thumbnail = games_total;
            
	            return _url+string(t)+".png";
	            break;
	        }
	    }

	    //Depois checar nome do arquivo
	    for(p=1; p<_total+1; p+=1){
        
	        var _title, _tagA, _tagB, _tagC, _tagD, _tagE, _tagF, _forward, _shortcut, _animframes, _animspeed;
    
	        ini_open(game_save_id+"network\\appdb.ini");
	        _forward = ini_read_real(string(p),"forward",0);
	        _shortcut = ini_read_real(string(p),"shortcut",0);
	        _animframes = ini_read_real(string(p),"animframes",0);
	        _animspeed = ini_read_real(string(p),"animspeed",0);
	        _title = ini_read_string(string(p),"title","");
	        _tagA = ini_read_string(string(p),"tagA","");
	        _tagB = ini_read_string(string(p),"tagB","");
	        _tagC = ini_read_string(string(p),"tagC","");
	        _tagD = ini_read_string(string(p),"tagD","");
	        _tagD = ini_read_string(string(p),"tagD","");
	        _tagE = ini_read_string(string(t),"tagE","");
	        _tagF = ini_read_string(string(t),"tagF","");
	        ini_close();
        
	        //Checar nome do caminho (evita confudir executaveis com nomes iguais)
	        if(string_lower(filename_name(argument0)) == string_lower(_tagA))
	        ||(string_lower(filename_name(argument0)) == string_lower(_tagB))
	        ||(string_lower(filename_name(argument0)) == string_lower(_tagC))
	        ||(string_lower(filename_name(argument0)) == string_lower(_tagD))
	        ||(string_lower(filename_name(argument0)) == string_lower(_tagE))
	        ||(string_lower(filename_name(argument0)) == string_lower(_tagF)){
        
	            //Titulo
	            games_title[argument1] = _title;
            
	            //Configurações
	            games_shortcut[argument1] = real(_shortcut);
	            forwarder_openexplorer = _forward;
            
	            //Animação
	            games_animframes[argument1] = _animframes;
	            games_animspeed[argument1] = _animframes;
                  
	            //Lembrar posição da imagem na lista para mover depois
	            async_thumbnail = games_total;
            
	            return _url+string(p)+".png";
	            break;
	        }
	    }
	}
	return "";
}

/// @description ExecuteShell(fname,wait,hidden)
/// @param fname
/// @param wait
/// @param hidden
function ExecuteShell() {
	/* 
	    ExecuteShell(fname, wait, hidden);
	    fname: file, program, or command to execute.
	    wait: wait for file to close before resume?
	    hidden: hide all files opened from command?
	    "hidden" is both optional and Windows-only.
	    "hidden" only works on files, not programs.
	    "hidden" can hide batch files' cmd windows.
	*/

	if (os_type == os_windows) 
	{
	    if (argument_count <= 2)
	        var ExecuteShell_result = external_call(external_define("exeshell.dll", "ExecuteShell", dll_cdecl, ty_real, 2, ty_string, ty_real), argument[0], argument[1]);
	    else
	        var ExecuteShell_result = external_call(external_define("exeshell.dll", "ExecuteShellEx", dll_cdecl, ty_real, 3, ty_string, ty_real, ty_real), argument[0], argument[1], argument[2]);

	    external_free("exeshell.dll");
	    keyboard_clear(keyboard_lastkey);
	    mouse_clear(mouse_lastbutton);
	    return ExecuteShell_result;
	}
}

/// @description get_anim_frames(filename,index)
/// @param filename
/// @param index
function get_anim_frames(argument0) {

	//Sintaxe: imagem_anim00_speed00.png

	//Determinar quantidade de frames
	if(string_pos("_anim",filename_name(argument0)) != 0){

	    return real(string_digits(string_copy(filename_name(argument0),string_pos("_anim",filename_name(argument0))+4,3)));
	}
	else{
	    return 1;
	}
}

/// @description get_anim_speed(filename,index)
/// @param filename
/// @param index
function get_anim_speed(argument0) {

	//Sintaxe: imagem_anim00_speed00.png

	//Determinar velocidade de animação
	if(string_pos("_speed",filename_name(argument0)) != 0){

	    return real(string_digits(string_copy(filename_name(argument0),string_pos("_speed",filename_name(argument0))+5,3)));
	}
	else{
	    return 0;
	}
}

/// @description audio_play_sfx(sound)
/// @param sound
function audio_play_sfx(argument0) {
	
	audio_stop_sound(argument0);
	audio_play_sound(argument0,0,0);
}

/// @description draw_text_shadow(x,y,string)
/// @param x
/// @param y
/// @param string
function draw_text_shadow(argument0, argument1, argument2) {
	if(oLauncher.theme == 0){

	    //Horizontal + Vertical
	    draw_text_colour(argument0-3,argument1,string_hash_to_newline(argument2),c_black,c_black,c_black,c_black,0.02);
	    draw_text_colour(argument0+3,argument1,string_hash_to_newline(argument2),c_black,c_black,c_black,c_black,0.02);
	    draw_text_colour(argument0,argument1-3,string_hash_to_newline(argument2),c_black,c_black,c_black,c_black,0.02);
	    draw_text_colour(argument0,argument1+3,string_hash_to_newline(argument2),c_black,c_black,c_black,c_black,0.02);
    
	    //Diagonal
	    draw_text_colour(argument0-3,argument1-3,string_hash_to_newline(argument2),c_black,c_black,c_black,c_black,0.06);
	    draw_text_colour(argument0+3,argument1+3,string_hash_to_newline(argument2),c_black,c_black,c_black,c_black,0.04);
	    draw_text_colour(argument0-3,argument1+3,string_hash_to_newline(argument2),c_black,c_black,c_black,c_black,0.06);
	    draw_text_colour(argument0+3,argument1-3,string_hash_to_newline(argument2),c_black,c_black,c_black,c_black,0.04);
	}
	else{

	    //Horizontal + Vertical
	    draw_text_colour(argument0-3,argument1,string_hash_to_newline(argument2),c_black,c_black,c_black,c_black,0.02+0.03);
	    draw_text_colour(argument0+3,argument1,string_hash_to_newline(argument2),c_black,c_black,c_black,c_black,0.02+0.03);
	    draw_text_colour(argument0,argument1-3,string_hash_to_newline(argument2),c_black,c_black,c_black,c_black,0.02+0.03);
	    draw_text_colour(argument0,argument1+3,string_hash_to_newline(argument2),c_black,c_black,c_black,c_black,0.02+0.03);
    
	    //Diagonal
	    draw_text_colour(argument0-3,argument1-3,string_hash_to_newline(argument2),c_black,c_black,c_black,c_black,0.06+0.03);
	    draw_text_colour(argument0+3,argument1+3,string_hash_to_newline(argument2),c_black,c_black,c_black,c_black,0.04+0.03);
	    draw_text_colour(argument0-3,argument1+3,string_hash_to_newline(argument2),c_black,c_black,c_black,c_black,0.06+0.03);
	    draw_text_colour(argument0+3,argument1-3,string_hash_to_newline(argument2),c_black,c_black,c_black,c_black,0.04+0.03);
	}
}