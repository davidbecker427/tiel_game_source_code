extends Node2D


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scene's/instructions.tscn")


func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://scene's/options.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()



func _on_inloggen_pressed() -> void:
	get_tree().change_scene_to_file("res://scene's/loggin.tscn")



func _on_leaderboard_pressed() -> void:
	get_tree().change_scene_to_file("res://scene's/leaderboard.tscn")
