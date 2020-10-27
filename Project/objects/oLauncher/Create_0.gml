/// @description NNITY LAUNCHER
image_speed = 0;
image_index = 0;

//Misc.
delay = 0;
is_playing = 0;
mov_time = 0;
nav_time = 60;
icon_select = -1;
network_anim = 0;
outside_submenu = 0;

//Animações
wp_x = 0;
wp_y = 0;
offset = 98;
offset_v = 32;
clock_blink = ":";

//BAT de boot
boot_res = "";
boot_priority = "";
boot_wait = "/WAIT ";
boot_attach = "";

//Mover
move = 0;
move_origin = -1;
move_temp_title = "";
move_temp_path = "";
move_temp_forwarder = "";
move_temp_subselect = 0;
move_temp_shortcut = 1;
move_temp_animframes = 1;
move_temp_animspeed = 0;
move_temp_playtime[0] = "0";
move_temp_playtime[1] = "0";
move_temp_thumbnail = noone;

//Tempo
time_start = 0;

//Controle dos Pais
parental_offset = 0;
parental_unlock = 0;
parental_fade = 3;
parental_fadeicons = 1;

//Dialogo
dialog = 0;
dialog_description = "";
dialog_return = "";
dialog_inputb = " ";
dialog_filterleft = 1280;
dialog_filterright = 1280;

//Criar lista de arquivos de pasta
forwarder = 0;
forwarder_fade = 0;
forwarder_subfolder = "";
forwarder_subfolder_path = "";
forwarder_select = 0;
forwarder_find = 0;
forwarder_total = 0;
forwarder_list = ds_map_create();
forwarder_file = "";

forwarder_listoffset = 0;
forwarder_openexplorer = "0";

//Informações
infopopup = 0;
infopopup_fade = 0;

//Configurações
settingsmenu = 0;
settingsmenu_fade = 0;
settingsmenu_select = 7;

//Cor do Seletor
col_numb = 0;
col_mod = 0;

//Emojis do RPC
emoji_lib = "🔍 | ";
emoji_games = "⭐ | ";
emoji_playing = "🎮 | ";
emoji_forward = "⭐ | ";

//Efeitos de blink
blink_delay = 60;

//Analógicos do Gamepad
var _gp;
for(_gp = 0; _gp < 5; _gp += 1){

    gp_stick[_gp,0] = 0;
    gp_stick[_gp,1] = 0;
    gp_stick[_gp,2] = 0;
    gp_stick[_gp,3] = 0;
}

