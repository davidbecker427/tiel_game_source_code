extends Control

var database : SQLite

func _ready():
	database = SQLite.new()
	database.path="res://data.db"
	database.open_db()

func _on_create_database_player_pressed() -> void:
	var table = {
		"id" : {"data_type":"int", "primary_key": true, "not_null" : true, "auto_increment" : true },
		"name" : {"data_type":"text" },
		"password" : {"data_type": "text"}
	}
	database.create_table("playerdata", table)

func create_user(username: String, password: String):
	database.query_with_bindings(
		"SELECT * FROM playerdata WHERE name = ?",
		[username]
	)

	if database.query_result.size() > 0:
		print("Gebruikersnaam bestaat al!")
		return

	var password_hash = password.sha256_text()

	var data = {
		"name": username,
		"password": password_hash
	}
	database.insert_row("playerdata", data)
	
func _on_create_acount_pressed() -> void:
	create_user(
		$username_regestraatie.text,
		$wachtwoord_regestraatie.text
	)

func _on_terug_naar_login_pressed() -> void:
	get_tree().change_scene_to_file("res://scene's/loggin.tscn")
	

func _on_create_database_score_pressed() -> void:
	var table = {
		"id" : {"data_type":"int", "primary_key": true, "not_null" : true, "auto_increment" : true },
		"player_id" : {"data_type":"int", "not_null":true },
		"score" : {"data_type":"int" },
		"datum" : {"data_type": "datetime"}
	}
	database.create_table("player_scoreB", table)
