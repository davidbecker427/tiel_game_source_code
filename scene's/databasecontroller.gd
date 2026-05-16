extends Control
#
var database : SQLite

func _ready():
	database = SQLite.new()
	database.path="res://data.db"
	database.open_db()

func _on_create_table_button_down() -> void:
	var table = {
		"id" : {"data_type":"int", "primary_key": true, "not_null" : true, "auto_increment" : true },
		"name" : {"data_type":"text" }
	}
	database.create_table("player", table)
	
	
	
func _on_insert_data_button_down() -> void:
	var data = {
		"name" : $name.text
	}
	
	database.insert_row("player", data)
