//Automatico
start = 0;
last = 0;
scale = 0;
textanim = 0;
update = 0;
update_select = 0;
image_speed = 0;
image_index = 0;

//Exibição
sprite_index = spr_assistant_a;
show_text = -1;
show_posx = 640;
show_posy = 100;
show_textx = 0;
show_texty = 0;
show_textmod = 3; //0 = esquerda, 1 = direita, 2 = cima, 3 = baixo
show_highlight_x1 = 0;
show_highlight_y1 = 0;
show_highlight_x2 = 0;
show_highlight_y2 = 0;

//Predefinições
def_sprite = sprite_index; //Expressão da Ninny
def_text = -1; //Texto especifico
def_posx = 640; //Posição X da Ninny
def_posy = 100; //Posição Y da Ninny
def_textmod = 2; //Alinhamento do texto
def_continuous = 0; //Animação continua sem fazer transição
def_highlight = 0;
def_highlight_x1 = 500;
def_highlight_y1 = 600;
def_highlight_x2 = 700;
def_highlight_y2 = 650;

//Impedir controle da interface
with(oLauncher){

    settingsmenu = 0;
    parental_control = 0;
    parental_offset = 0;
    parental_unlock = 0;
    parental_fade = 3;
    parental_fadeicons = 1;
}

