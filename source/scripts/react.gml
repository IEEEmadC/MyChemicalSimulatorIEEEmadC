///react(list, map, total)
/*
Construccion de la consulta a la base de datos
argument0: lista de moleculas
argument1: mapa de moleculas por cantidad
argument2: cantidad total de atomos 
*/
var mol = argument0;
var cant = argument1;
var tt = argument2;
var query = ";";

switch(ds_list_size(mol)) {
    case 1:
        if (tt <=2) || (tt == 4) {
        query = "SELECT tp.desc_tipo_reaccion, rm2.cant_mol, m2.s_formula, r.id_reaccion
            FROM Molecula m1, Molecula m2, reaccion_molecula rm1, reaccion_molecula rm2,
            Reaccion r, rol_molecula rol1, rol_molecula rol2, Tiporeaccion tp
            WHERE m1.s_formula='"+ (mol[| 0]).formula +"' AND m1.id_molecula = rm1.id_molecula 
            AND rm1.cant_mol='"+ string(cant[? (mol[| 0]).formula]) +"' 
            AND r.id_reaccion = rm1.id_reaccion AND m2.id_molecula = rm2.id_molecula 
            AND r.id_reaccion = rm2.id_reaccion AND r.id_tipo_reaccion=tp.id_tipo_reaccion 
            AND rm1.id_rol = rol1.id_rol AND rol1.desc_rol = 'REACTIVO' 
            AND rm2.id_rol = rol2.id_rol AND rol2.desc_rol = 'PRODUCTO'
            ;";
        }
        break;
    case 2:
        query = "SELECT tp.desc_tipo_reaccion, rm3.cant_mol, m3.s_formula, r.id_reaccion
            FROM Molecula m1, Molecula m2, Molecula m3, reaccion_molecula rm1, reaccion_molecula rm2, 
            reaccion_molecula rm3, Reaccion r, rol_molecula rol1, rol_molecula rol2, rol_molecula rol3, 
            Tiporeaccion tp 
            WHERE m1.s_formula= '"+ (mol[| 0]).formula +"' AND m2.s_formula = '"+ (mol[| 1]).formula +"' 
            AND rm1.cant_mol='"+ string(cant[? (mol[| 0]).formula]) +"' 
            AND rm2.cant_mol='"+ string(cant[? (mol[| 1]).formula]) +"' 
            AND m1.id_molecula = rm1.id_molecula AND r.id_reaccion = rm1.id_reaccion 
            AND m2.id_molecula = rm2.id_molecula AND r.id_reaccion = rm2.id_reaccion 
            AND r.id_reaccion = rm2.id_reaccion AND r.id_tipo_reaccion=tp.id_tipo_reaccion 
            AND rm1.id_rol = rol1.id_rol AND rol1.desc_rol = 'REACTIVO' 
            AND rm2.id_rol = rol2.id_rol AND rol2.desc_rol = 'REACTIVO' 
            AND rol3.desc_rol = 'PRODUCTO' AND rol3.id_rol = rm3.id_rol
            AND rm3.id_reaccion = r.id_reaccion AND rm3.id_molecula = m3.id_molecula
            ;";
        break;
    default:
        break;
}

return runQuery(query, false);

