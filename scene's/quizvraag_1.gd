extends Control
@onready var coin_label = %Label

var database : SQLite

func _ready():
	update_coin_label()
	database = SQLite.new()
	database.path = "res://data.db"
	database.open_db()

func _on_button_pressed() -> void:
	set_coin(Gamemanger.coin_counter + 10)
	var data = {
		"player_id": Gamemanger.current_player_id,
		"score" : Gamemanger.coin_counter,
		"datum": Time.get_datetime_string_from_system()
	}
	var success = database.insert_row("player_scoreB", data)
	get_tree().change_scene_to_file("res://scene's/goedantwoordscherm.tscn")

func set_coin(new_coin_count : int) -> void:
	Gamemanger.coin_counter = new_coin_count
	update_coin_label()

func update_coin_label():
	coin_label.text = "coin count: " + str(Gamemanger.coin_counter)

func _on_fout_antwoord_1_pressed() -> void:
	var data = {
		"player_id": Gamemanger.current_player_id,
		"score" : Gamemanger.coin_counter,
		"datum": Time.get_datetime_string_from_system()
	}
	var success = database.insert_row("player_scoreB", data)
	get_tree().change_scene_to_file("res://scene's/foutantwoordt.tscn")

func _on_fout_antwoord_2_pressed() -> void:
	set_coin(Gamemanger.coin_counter - 10)
	var data = {
		"player_id": Gamemanger.current_player_id,
		"score" : Gamemanger.coin_counter,
		"datum": Time.get_datetime_string_from_system()
	}
	var success = database.insert_row("player_scoreB", data)
	get_tree().change_scene_to_file("res://scene's/foutantwoordt.tscn")

func _on_fout_antwoord_3_pressed() -> void:
	set_coin(Gamemanger.coin_counter - 10)
	var data = {
		"player_id": Gamemanger.current_player_id,
		"score" : Gamemanger.coin_counter,
		"datum": Time.get_datetime_string_from_system()
	}
	var success = database.insert_row("player_scoreB", data)
	get_tree().change_scene_to_file("res://scene's/foutantwoordt.tscn")
