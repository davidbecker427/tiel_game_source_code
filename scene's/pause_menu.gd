extends CanvasLayer
#waneer de game wordt gestart dan kan je niet het menu zien
func _ready() -> void:
	visible = false
	get_tree().paused = false

#als op de ui cancel knop wordt gedrukt (esc) dan wordt het menu visable
#en als het menu all visble was dan wordt het invisble als er weer op de knop
#wordt gedrukt
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		if get_tree().paused:
			visible = false
			get_tree().paused = false
		else:
			visible = true
			get_tree().paused = true

func _on_resume_pressed() -> void:
	visible = false
	get_tree().paused = false

func _on_quit_pressed() -> void:
	get_tree().quit()
	pass 

func _on_back_to_main_menu_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scene's/main menu.tscn")
	Gamemanger.coin_counter = 0
	pass 


func _on_to_leaderboard_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scene's/leaderboard.tscn")
	Gamemanger.coin_counter = 0
