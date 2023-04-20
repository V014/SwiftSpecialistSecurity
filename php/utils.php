<?php
// this function escapes user input with dangerous code
function escString($connection, $string) {
	$result = mysqli_real_escape_string($connection, $string);
	return $result;
}
// this function redirects the user to a different page
function redirect_to($new_location) {
	header("Location: ". $new_location);
	exit();
}
// this function deletes a row, takes in an ID and a table name.
function deleteInfo($id, $tableName) {
	$result = "DELETE FROM $tableName WHERE `Id` = $id"; 
	return $result;
}
// this function selects info, takes in an array and table name
function buildInsert($fields, $tableName) {
	$columns = implode(', ', array_keys($fields));
	$values = implode(', ', array_values($fields)); 
	$result = "INSERT INTO $tableName VALUES ($values)";
	return $result;
}
// this function updates info, takes in an arrat and table name
function updateInsert($fields, $string, $tableName, $id) {
	$columns = implode(', ', array_values($fields));
	$text = implode(', ', array_values($string));
	$result = "UPDATE $tableName SET $columns = $text WHERE Id = $id";
	return $result;
}
// this function selects data from the db
function selectData($fields, $table){
	$query = "SELECT $fields FROM $table";
	$result = mysqli_fetch_array($query);
	return $result[0];
}
?>