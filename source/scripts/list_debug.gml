#define list_debug
///list_debug(list)

var mol = argument0;

if ds_exists(mol, ds_type_list) {
    if not ds_list_empty(mol) {
        for (var i=0; i<ds_list_size(mol);i++) {
            show_debug_message(string(i+1)+": " + ds_list_find_value(mol, i).formula);
        }
    } else {
        show_debug_message("Colision vacia!!!");
    } 
}





#define debug_db
///debug_db(list)
var mol = argument0;

if ds_exists(mol, ds_type_list) {
    if not ds_list_empty(mol) {
        for (var i=0; i<ds_list_size(mol);i++) {
            show_debug_message(string(i+1)+": " + ds_list_find_value(mol, i));
        }
    } else {
        show_debug_message("Consulta vacia!!!");
    } 
}



#define debug_col
///debug_col(list, map);
var list = argument0;
var map = argument1;
var f;

if not ds_list_empty(list) and not ds_map_empty(map) {
    for(var i=0; i<ds_list_size(list); i++) {
        f = (list[| i]).formula;
        
        show_debug_message(string(i+1)+": " + string(map[? f]) + f)
        //show_debug_message(argument1+string(i+1)+": " + string(ds_map_find_value(mapa, (ds_list_find_value(lista, i).formula))) + ds_list_find_value(lista, i).formula)
    }
} else {
    show_debug_message("Mapa vacio!!!");
}

#define debug_elem
///debug_elem(list)
var mol = argument0;

if ds_exists(mol, ds_type_list) {
    if not ds_list_empty(mol) {
        for (var i=0; i<ds_list_size(mol);i++) {
            show_debug_message(string(i+1)+": " + ds_list_find_value(mol, i).simbolo);
        }
    } else {
        show_debug_message("Consulta vacia!!!");
    } 
}