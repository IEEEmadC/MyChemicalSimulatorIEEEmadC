//===============================================================
// runDMLs()
//===============================================================
var contentValueId = ContentValuesCreate();
ContentValuesPut(contentValueId,"username","new_user");
ContentValuesPut(contentValueId,"password","contentValue999");
var new_id = ExecuteInsert(contentValueId, "users");
show_debug_message("Inserted id is :"+new_id);
ContentValuesDelete(contentValueId);
runQuery( "SELECT * FROM users", true);
//-------------------------------------------------------------------------------------------
contentValueId = ContentValuesCreate();
ContentValuesPut(contentValueId,"password","contentValue888");
var rowCount = ExecuteUpdate(contentValueId, "users", new_id);
show_debug_message("Updated row count is :"+rowCount);
ContentValuesDelete(contentValueId);
runQuery( "SELECT * FROM users", true);
//-------------------------------------------------------------------------------------------
rowCount = ExecuteDelete("users", new_id);
show_debug_message("Deleted row count is :"+rowCount);
runQuery( "SELECT * FROM users", true);
//-------------------------------------------------------------------------------------------
