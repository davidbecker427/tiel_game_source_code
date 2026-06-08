extends Control

var database : SQLite

func _ready():
	database = SQLite.new()
	database.path="res://data.db"
	database.open_db()

func _on_create_database_score_pressed() -> void:
	var table = {
		"id" : {"data_type":"int", "primary_key": true, "not_null" : true, "auto_increment" : true },
		"name" : {"data_type":"text" },
		"score" : {"data_type": "int"}
	}
	database.create_table("playertest", table)
