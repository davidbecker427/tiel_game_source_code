extends CharacterBody2D

var is_chatting = false
var player
var player_in_chat_zone = false

func _process(delta):
	if Input.is_action_just_pressed("chat") and player_in_chat_zone:
		print("chatting with npc")
		$dialogue.start()
		player.set_key(Gamemanger.set_max_keys)
		print(Gamemanger.key_counter)
		is_chatting = true

func _on_chat_detection_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player = body
		player_in_chat_zone = true


func _on_chat_detection_area_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_in_chat_zone = false

func _on_dialogue_dialogue_finshed() -> void:
	print(Gamemanger.key_counterc)
	is_chatting = false
	pass # Replace with function body.
