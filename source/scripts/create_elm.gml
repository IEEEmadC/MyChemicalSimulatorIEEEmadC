///create_elm(x, y, simbolo)
var newElm = instance_create(argument0, argument1, Element)
var data = runQuery("SELECT * FROM Elemento 
            WHERE s_simbolo='" + argument2 + "';", false);
with newElm {
    numero = real(ds_list_find_value(data, 0));
    simbolo = ds_list_find_value(data, 1);
    tipoOx = ds_list_find_value(data, 2);
    nombre = ds_list_find_value(data, 3);
    electronegatividad = real(ds_list_find_value(data, 4));
    afinidad = real(ds_list_find_value(data, 5));
    ionizacion = real(ds_list_find_value(data, 6));
    prefijo = ds_list_find_value(data, 8);
    configuracion = ds_list_find_value(data, 9);
}
ds_list_destroy(data);

return newElm;

