///sintesis2(newMol1, newMol2, others)
// argument0: Primera nueva molecula
// argument1: Segunda nueva molecula
// argument2: lista de moleculas en colision

var aux, elm, i, j;
for (i=0; i<ds_list_size(argument2); i++) {
    aux = argument2[| i];
    for(j=0; j<ds_list_size(aux.elementos); j++) {
        elm = aux.elementos[| j];
        if (j mod 2 == 0) {
            elm.molecula_padre = argument0.id
            ds_list_add(argument0.elementos, elm);
        } else {
            elm.molecula_padre = argument1.id
            ds_list_add(argument1.elementos, elm);
        }
    }
    ds_list_clear(aux.elementos); 
}
