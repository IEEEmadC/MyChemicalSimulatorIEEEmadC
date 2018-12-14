#define e_sort
///e_sort(list)
/*
 * Orden de los elementos por electronegatividad ascendente 
 * argument0: lista a ordenar
 */
var N = ds_list_size(argument0);
var s = noone;
var j = 0;
for (var i=1; i<N; i++) {
    j = i;
    s = ds_list_find_value(argument0, j);
    while (ds_list_find_value(argument0, j-1).electronegatividad > s.electronegatividad && j>0) {
        ds_list_replace(argument0, j, ds_list_find_value(argument0, j-1));
        j--;
    }
    ds_list_replace(argument0, j, s);
}

#define e_sort2
///e_sort2(list)

var sorted_list = ds_priority_create()

var N = ds_list_size(argument0);
var i, inst;

//Primer ciclo para añadir los elementos a la cola
for(i = 0; i < N; i++) {
    inst = argument0[| i];
    ds_priority_add(sorted_list, inst, inst.electronegatividad);
}
ds_list_clear(argument0);

//Segundo ciclo para obtenerlos organizados
for(i = 0; i < N; i++) {
    inst = ds_priority_delete_min(sorted_list);
    ds_list_add(argument0, inst);
}

ds_priority_destroy(sorted_list);