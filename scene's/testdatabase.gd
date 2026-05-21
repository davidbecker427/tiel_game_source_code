extends Control

var database : SQLite
@onready var player = get_node("../player")

func _ready():
	database = SQLite.new()
	database.path="res://data.db"
	database.open_db()

func _on_create_table_button_down() -> void:
	var table = {
		"id" : {"data_type":"int", "primary_key": true, "not_null" : true, "auto_increment" : true },
		"name" : {"data_type":"text" },
		"score" : {"data_type": "int"}
	}
	database.create_table("playertest", table)
	
	
	
func _on_insert_data_button_down() -> void:
	var data = {
		"name" : $name.text,
		"score" : player.coin_counter
	}
	var success = database.insert_row("playertest", data)
