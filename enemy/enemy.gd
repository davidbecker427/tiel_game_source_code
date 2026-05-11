extends CharacterBody2D

enum { IDLE, MOVE }


var speed = 100
var player = null
var player_chase = false

func _physics_process(delta):
	if player_chase and player != null:
		var direction = (player.position - position).normalized()
		velocity = direction * speed
		
		# animation
		if abs(direction.x) > abs(direction.y):
			if direction.x > 0:
				$AnimatedSprite2D.play("walk_e")
			else:
				$AnimatedSprite2D.play("walk_w")
		else:
			if direction.y > 0:
				$AnimatedSprite2D.play("walk_s")
			else:
				$AnimatedSprite2D.play("walk_n")
	else:
		velocity = Vector2.ZERO
		$AnimatedSprite2D.play("idle")

	move_and_slide()

func _on_detection_area_body_entered(body):
	player = body
	player_chase = true

func _on_detection_area_body_exited(body):
	player = null
	player_chase = false

func _on_hit_area_body_entered(body):
	if body.is_in_group("player"):
		player = body
		player.lose_coin(1)  
