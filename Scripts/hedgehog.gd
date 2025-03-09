extends CharacterBody2D


var speed = -60

var facing_right = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	if !$RayCast2D.is_colliding() && is_on_floor():
		flip()
		
	$Sprite.play("run")
	
	velocity.x = speed
	move_and_slide()

func flip():
	facing_right = !facing_right
	
	scale.x = abs(scale.x) * -1
	if facing_right:
		speed = abs(speed)
	else:
		speed = abs(speed) * -1


func _on_hitbox_area_entered(area: Area2D) -> void:
	if area.get_parent() is Player:
		area.get_parent().die()
