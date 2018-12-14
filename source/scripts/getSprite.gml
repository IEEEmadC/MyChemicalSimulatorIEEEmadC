///get_sprite(simbolo)
//=========================================================
// addElement(String name)
//=========================================================
// Returns the required sprite
DerpXmlRead_OpenFile("sprites.xml");
while DerpXmlRead_Read() {
    if DerpXmlRead_CurValue() == "subtexture" {
        if DerpXmlRead_CurGetAttribute("name") == argument0 {
            var _x = real(DerpXmlRead_CurGetAttribute("x"));
            var _y = real(DerpXmlRead_CurGetAttribute("y"));
            var _w = real(DerpXmlRead_CurGetAttribute("width"));
            var _h = real(DerpXmlRead_CurGetAttribute("height"));
            break;
        }
    }
}
var s = surface_create(sprite_get_width(sprite_elements), sprite_get_height(sprite_elements));
surface_set_target(s);
draw_sprite(sprite_elements,0,0,0);
var sprite = sprite_create_from_surface(s,_x,_y,_w,_h,false,false,_w/2,_h/2)
sprite_collision_mask(sprite, false, 0, 0, 0, 0, 0, 0, 0);
surface_free(s);
DerpXmlRead_CloseFile();
return sprite;
