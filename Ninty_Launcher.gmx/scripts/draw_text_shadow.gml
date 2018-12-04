///draw_text_shadow(x, y, string, shadow length, shadow direction, shadow color, shadow alpha);
// @tehwave

/*  Argument            Description

0   x                   The x coordinate of the drawn string. 
1   y                   The y coordinate of the drawn string. 
2   string              The string to draw. 
    
3   shadow length       The distance in pixels between text and shadow.
4   shadow direction    The angle of the shadow.
5   shadow color        The color of the shadow.
6   shadow alpha        The alpha of the shadow.
*/

//init & assign vars
var xx = argument0, yy = argument1, str = argument2, sh_len = argument3,
    sh_dir = argument4, prev_alpha = draw_get_alpha(), prev_col = draw_get_color();
    
//draw text shadow
draw_set_color(argument5);
draw_set_alpha(argument6);
draw_text(xx+lengthdir_x(sh_len,sh_dir),yy+lengthdir_y(sh_len,sh_dir),str);

//draw text
draw_set_color(prev_col);
draw_set_alpha(prev_alpha);
draw_text(xx,yy,str);

