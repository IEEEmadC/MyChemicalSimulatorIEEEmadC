#define sintesis
/// sintesis(newMol, others);
// argument0: Nueva molecula
// argument1: lista de moleculas en colision

var aux, elm;
for (var i = 0; i < ds_list_size(argument1); i += 1) {
    aux = argument1[| i];
    for (var j = 0; j < ds_list_size(aux.elementos); j += 1) {
        elm = aux.elementos[| j];
        elm.molecula_padre = argument0.id;
        ds_list_add(argument0.elementos, elm);
    }
    ds_list_clear(aux.elementos);
}


#define sintesis2
///sintesis2(newMol1, newMol2, others)
// argument0: Primera nueva molecula
// argument1: Segunda nueva molecula
// argument2: lista de moleculas en colision

var mol, elm, i, j;
var elems = ds_list_create();
for (i=0; i<ds_list_size(argument2); i++) {
    mol = argument2[| i];
    for (var j=0; j<ds_list_size(mol.elementos); j++) {
        ds_list_add(elems, mol.elementos[| j]);
    }
    ds_list_clear(mol.elementos);
}
e_sort2(elems);
for (i=0; i<ds_list_size(elems); i++) {
    elm = elems[| i];
    if (i mod 2 == 0) {
        elm.molecula_padre = argument0.id;
        ds_list_add(argument0.elementos, elm);
    } else {
        elm.molecula_padre = argument1.id;
        ds_list_add(argument1.elementos, elm);
    }
}

ds_list_clear(elems);
ds_list_destroy(elems);