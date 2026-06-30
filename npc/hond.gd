extends CharacterBody2D

const speed = 100

var current_state = IDLE
var dir = Vector2.RIGHT
var start_pos
var is_roaming = true
var is_chatting = false
var player
var player_in_chat_zone = false

enum { IDLE, NEW_DIR, MOVE }


func _ready():
	randomize()
	start_pos = position


func _process(delta):
#de random movement van de npc + dat die moet stoppen als de player met hem praat
	if is_roaming:
		match current_state:
			IDLE:
				pass
			NEW_DIR:
				dir = choose([Vector2.RIGHT, Vector2.UP, Vector2.LEFT, Vector2.DOWN])
			MOVE:
				move(delta)
		if Input.is_action_just_pressed("chat") and player_in_chat_zone:
			print("chatting with npc")
			$dialogue.start()
			is_roaming = false
			is_chatting = true


func choose(array):
	array.shuffle()
	return array.front()


func move(delta):
	if !is_chatting:
		velocity = dir * speed
		move_and_slide()

#waneer de player in de chat detection area stapt dan kan de player met hem praten
func _on_chat_detection_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player = body
		player_in_chat_zone = true


func _on_chat_detection_area_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_in_chat_zone = false

#hoelang die moet wachten todat die weer kan lopen / ander random derectie op gaat
func _on_timer_timeout() -> void:
	$Timer.wait_time = choose([0.5, 1, 1.5])
	current_state = choose([IDLE, NEW_DIR, MOVE])
	


#waneer de dialoog klaar is / player uit de chat zone is 
#dan gaat de npc weer random rond lopen
func _on_dialogue_dialogue_finshed() -> void:
	is_chatting = false
	is_roaming = true
