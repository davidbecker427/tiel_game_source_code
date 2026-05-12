extends Area2D

var entered = false

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
			get_tree().change_scene_to_file("res://scene's/quizvraag1.tscn")
