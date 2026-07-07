extends Area2D
var database : SQLite
var entered = false
@onready var player = get_node("../player")


func _ready():
	database = SQLite.new()
	database.path="res://data.db"
	database.open_db()

func _on_body_entered(body: CharacterBody2D):
	if body.name == "player":
		entered = true

func _on_body_exited(body: CharacterBody2D):
	if body.name == "player":
		entered = false

#waneer de input voor exit level wordt gedrukt (E) in de zone
#dan gaat de naar het volgende level
func _process(delta):
	if entered:
		if Input.is_action_just_pressed("exit_level"):
			var data = {
				"player_id": Gamemanger.current_player_id,
				"score" : Gamemanger.coin_counter,
				"datum": Time.get_datetime_string_from_system()
			}
			var success = database.insert_row("player_scoreB", data)
			get_tree().change_scene_to_file("res://scene's/quizvraag1.tscn")
			Gamemanger.cookie_counter = 0
			Gamemanger.key_counter = 0
