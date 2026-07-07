extends CharacterBody2D

const speed = 100

var current_state = IDLE
var dir = Vector2.RIGHT
var start_pos
var is_roaming = true
var is_chatting = false
var player = null
var player_chase = false
var player_in_chat_zone = false

enum { IDLE, NEW_DIR, MOVE }


func _ready():
	randomize()
	start_pos = position


func _process(delta):
	if player_chase and player != null:
		var direction = (player.position - position).normalized()
		velocity = direction * speed
		move_and_slide()
		
	if is_roaming:
		match current_state:
			IDLE:
				pass
			NEW_DIR:
				dir = choose([Vector2.RIGHT, Vector2.UP, Vector2.LEFT, Vector2.DOWN])
			MOVE:
				move(delta)
	if Input.is_action_just_pressed("chat") and player_in_chat_zone:
		if Gamemanger.cookie_counter >= 1:
			print("test")
			$dialogue.start()
			player.lose_cookie(1)
			is_roaming = false
			is_chatting = true
			player.geef_over_water_lopen(30.0)
			if Gamemanger.cookie_counter <= 1:
				player = null
				player_chase = false
				is_roaming = true
				current_state = true

func choose(array):
	array.shuffle()
	return array.front()


func move(delta):
	if !is_chatting:
		velocity = dir * speed
		move_and_slide()
#hoelang die moet wachten todat die weer kan lopen / ander random derectie op gaat
func _on_timer_timeout() -> void:
	$Timer.wait_time = choose([0.5,])
	current_state = choose([IDLE, NEW_DIR, MOVE])
	


func _on_cookie_detection_area_body_entered(body: Node2D) -> void:
	player = body
	if Gamemanger.cookie_counter >= 1 and body.is_in_group("player"):
		player_chase = true
		is_roaming = false
		current_state = false
		
	elif Gamemanger.cookie_counter <= 1:
		player = null
		player_chase = false
		is_roaming = true
		current_state = true


func _on_geef_cookie_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player = body 
		player_in_chat_zone = true



func _on_dialogue_dialogue_finshed() -> void:
	is_chatting = false
	is_roaming = true


func _on_geef_cookie_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_in_chat_zone = false
