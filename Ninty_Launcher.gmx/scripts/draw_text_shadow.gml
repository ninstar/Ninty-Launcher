///draw_text_shadow(x,y,string)
if(obj_launcher.theme == 0){

    //Horizontal + Vertical
    draw_text_colour(argument0-3,argument1,argument2,c_black,c_black,c_black,c_black,0.02);
    draw_text_colour(argument0+3,argument1,argument2,c_black,c_black,c_black,c_black,0.02);
    draw_text_colour(argument0,argument1-3,argument2,c_black,c_black,c_black,c_black,0.02);
    draw_text_colour(argument0,argument1+3,argument2,c_black,c_black,c_black,c_black,0.02);
    
    //Diagonal
    draw_text_colour(argument0-3,argument1-3,argument2,c_black,c_black,c_black,c_black,0.06);
    draw_text_colour(argument0+3,argument1+3,argument2,c_black,c_black,c_black,c_black,0.04);
    draw_text_colour(argument0-3,argument1+3,argument2,c_black,c_black,c_black,c_black,0.06);
    draw_text_colour(argument0+3,argument1-3,argument2,c_black,c_black,c_black,c_black,0.04);
};
else{

    //Horizontal + Vertical
    draw_text_colour(argument0-3,argument1,argument2,c_black,c_black,c_black,c_black,0.02+0.03);
    draw_text_colour(argument0+3,argument1,argument2,c_black,c_black,c_black,c_black,0.02+0.03);
    draw_text_colour(argument0,argument1-3,argument2,c_black,c_black,c_black,c_black,0.02+0.03);
    draw_text_colour(argument0,argument1+3,argument2,c_black,c_black,c_black,c_black,0.02+0.03);
    
    //Diagonal
    draw_text_colour(argument0-3,argument1-3,argument2,c_black,c_black,c_black,c_black,0.06+0.03);
    draw_text_colour(argument0+3,argument1+3,argument2,c_black,c_black,c_black,c_black,0.04+0.03);
    draw_text_colour(argument0-3,argument1+3,argument2,c_black,c_black,c_black,c_black,0.06+0.03);
    draw_text_colour(argument0+3,argument1-3,argument2,c_black,c_black,c_black,c_black,0.04+0.03);
};
