extends Control

@onready var coin_label = %label

func _ready():
	update_coin_label()

func set_coin(new_coin_count : int) -> void:
	Gamemanger.coin_counter = new_coin_count
	update_coin_label()

func update_coin_label():
	coin_label.text = "coin count: " + str(Gamemanger.coin_counter)

func _on_volgende_vraag_pressed() -> void:
	get_tree().change_scene_to_file("res://scene's/quizvraag2.tscn")
