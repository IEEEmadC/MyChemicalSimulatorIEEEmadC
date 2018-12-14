#define descubierta
///descubierta(formula)
var query = "UPDATE molecula SET b_conocida=1 WHERE s_formula='" + argument0 + "';";
ExecuteSQL(query);

#define desbloqueado
///desbloqueado(formula)
var query = "UPDATE elemento SET b_conocido=1 WHERE num_atomico<=" + string(argument0) + ";";
ExecuteSQL(query);
#define conocida
///conocida(reaccion)
var query = "UPDATE reaccion SET b_descubierta=1 WHERE id_reaccion=" + argument0 + ";";
ExecuteSQL(query);