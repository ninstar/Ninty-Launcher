/// @description Definições de Display

//Fator de escala automático
var _screen_size = display_get_width();

//+4K 
window_scale = 2;
display_reset(8,uirender); //AA: x8

//-4K 
if(_screen_size < 3840){
    window_scale = 1.5;
    display_reset(2,uirender); //AA: x2
}

//-2K
if(_screen_size < 2560){
    window_scale = 1;
	display_reset(0,uirender); //AA: x0
}

//-1080p
if(_screen_size < 1920)
    window_scale = 0.9;

//-900p
if(_screen_size < 1600)
    window_scale = 0.8;

//-768p
if(_screen_size < 1366)
    window_scale = 0.7;

//-720p
if(_screen_size < 1280)
    window_scale = 0.6;

//-4:3 768p
if(_screen_size < 1024)
    window_scale = 0.5;

//-4:3 600p
if(_screen_size < 800)
    window_scale = 0.4;

//-4:3 480p (Legacy Displays)
if(_screen_size < 640)
    window_scale = 0.25;

//Definir escala
window_set_size(1280*window_scale,720*window_scale);

//Tamanho padrão da interface relativa ao display
display_set_gui_size(1280,720);

