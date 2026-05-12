extends CharacterBody2D
#geeft aan hoe snell de player is
@export var speed = 200

@onready var coin_label = %Label

var coin_counter = 0
var enemy_inattack_range = false
var enemy_attack_cooldown = true

#pakt de movement inputs op
func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(_delta):
	get_input()
	move_and_slide()

#als er een coin wordt gecollect dan gaat er +1 by de counter
func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("coin"):
		set_coin(coin_counter + 1)
		print(coin_counter)

func set_coin(new_coin_count : int) -> void:
	coin_counter = new_coin_count
	coin_label.text = "coin count: " + str(coin_counter)
	
func lose_coin(amount: int) -> void:
	coin_counter = max(0, coin_counter - amount)
	coin_label.text = "coin count: " + str(coin_counter)
