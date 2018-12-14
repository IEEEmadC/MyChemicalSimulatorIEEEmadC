/// draw_formula(x, y, font, text)

var posx = argument0;
var posy = argument1;
var font = argument2;
var text = argument3;

draw_set_font(font);
var width = string_width_ext(text, -1, 20);

draw_text_ext(posx, posy, text, -1, 20);

return width;
