///enlarge(str)
//
// (ESP)
// Recupera el tamaño de una cadena de texto 
// agregando un conjunto de caracteres sucesivos
// a partir del numero de veces que se repite.
//
//     str      cadena de caracteres a alargar
//
// (ENG)
// Recovers the size of a text adding a set of 
// consecutive characters with the number of times
// it is needed.
//
//     str      a string to enlarge
//
//
/// GMLscripts.com/license 
{
    var str = argument0;
    var oldStr = "";
    var currentChar;
    var nextChar;
    var size = string_length(str);
    var amount = "";
    for (var i=1; i<=size; i++) {
        currentChar = string_char_at(str, i);
        if (i!=size) {
            nextChar = string_char_at(str, i+1);
        } else {
            nextChar = "";
        }
        if (nextChar == "(") {
            amount = "";
            while (nextChar != ")") {
                i++;
                nextChar = string_char_at(str, i+1);
                amount += nextChar;
            }
            repeat(real(amount)) {
                oldStr += currentChar;
            }
            i++;
        } else {
            oldStr += currentChar;
        }
    }
    return oldStr;
}
