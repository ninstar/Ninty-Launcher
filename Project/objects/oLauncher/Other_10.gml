/// @description Discord RPC padrão

//Emojis do RPC
if(iconrpc < 2){

    emoji_lib = "🔍 | ";
    emoji_games = "⭐ | ";
    emoji_playing = "🎮 | ";
    emoji_forward = "⭐ | ";
}
else{

    emoji_lib = "";
    emoji_games = "";
    emoji_playing = "";
    emoji_forward = "";
}

if(nativerpc == 1){
	
	setLargeImageText("rpc_"+string(iconrpc));
	setDetails(emoji_games+string(games_total)+" "+text_rpc[1]);
	setState(emoji_lib+text_rpc[0]);
	UpdatePresence();
}
    

