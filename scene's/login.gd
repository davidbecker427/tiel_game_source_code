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
	var password = $wachtwoord_inputfield.text

	var password_hash = password.sha256_text()

	var query = "SELECT * FROM playerdata WHERE name = '%s'" % username

	database.query(query)

	if database.query_result.size() > 0:
		var user = database.query_result[0]

		if user["password"] == password_hash:
			get_tree().change_scene_to_file("res://scene's/main menu.tscn")
	Gamemanger.player_name = $username_inputfield.text
