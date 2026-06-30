extends CharacterBody2D
#geeft aan hoe snell de player is
@export var speed = 200
@onready var coin_label = %Label
@onready var cookie_label = %cookiecounter
@onready var playercshape = get_node("Area2D/CollisionShape2D")

var enemy_inattack_range = false
var enemy_attack_cooldown = true


func _ready():
	add_to_group("player")
	update_coin_label()
	update_cookie_label()

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
		set_coin(Gamemanger.coin_counter + 1)
		print(Gamemanger.coin_counter)
		
	if area.is_in_group("cookie"):
		set_cookie(Gamemanger.cookie_counter + 1)
		print(Gamemanger.cookie_counter)
		
func set_coin(new_coin_count : int) -> void:
	Gamemanger.coin_counter = new_coin_count
	update_coin_label()
	
func set_cookie(new_cookie_count : int) -> void:
	Gamemanger.cookie_counter = new_cookie_count
	update_cookie_label()
	
	
func lose_coin(amount: int) -> void:
	Gamemanger.coin_counter = max(0, Gamemanger.coin_counter - amount)
	update_coin_label()

func lose_cookie(amount: int) -> void:
	Gamemanger.cookie_counter = max(0, Gamemanger.cookie_counter - amount)
	update_cookie_label()

func update_coin_label():
	coin_label.text = "coin count: " + str(Gamemanger.coin_counter)

func update_cookie_label():
	cookie_label.text = "cookie count: " + str(Gamemanger.cookie_counter)
	
