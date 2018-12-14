///runQuery(query, fetch_all)
//===============================================================
// runQuery(String query, Boolean _all)
//===============================================================
var query = argument0;
var _all = argument1;
var data = ds_list_create();

var cursorId = CursorOpen(query);
var cursorRows = CursorGetRowCount(cursorId);
var cursorColumns = CursorGetColumnCount(cursorId); 
if (_all) {
    for(var row = 0; row < real(cursorRows); row++){
        for(var column = 0; column < real(cursorColumns); column++){
            ds_list_add(data, CursorGetData( cursorId, string(row), string(column) ));
        }
    }
} else {
    var row = 0;
    for(var column = 0; column < real(cursorColumns); column++){
        ds_list_add(data, CursorGetData( cursorId, string(row), string(column) ));
    }
}
CursorClose( cursorId );
return data;
