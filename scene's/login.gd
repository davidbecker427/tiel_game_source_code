extends Control

var database : SQLite

func _ready():
	database = SQLite.new()
	database.path = "res://data.db"
	database.open_db()

func _on_naar_registraatie_pressed() -> void:
	get_tree().change_scene_to_file("res://scene's/registraatie.tscn")


func _on_inlogen_pressed() -> void:
	var username = $username_inputfield.text
	var password = $wachtwoord_LineEdit.text
	
	var password_hash = password.sha256_text()
	database.query_with_bindings(
		"SELECT * FROM playerdata WHERE name = ?",
		[username]
	)
	
	if database.query_result.size() == 0:
		print("dit acount bestaat niet")
		return
	
	var user = database.query_result[0]
	
	if user["password"] != password_hash:
		print("dit wachtwoord is niet juist")
		return
	
	Gamemanger.player_name = user["name"]
	Gamemanger.current_player_id = user["id"]
	get_tree().change_scene_to_file("res://scene's/main menu.tscn")
