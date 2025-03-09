extends CharacterBody2D
class_name Player


const SPEED = 100.0
const RUN_SPEED = 150.0
const JUMP_VELOCITY = -300.0

@onready var sprite_2d: AnimatedSprite2D = $Sprite2D

func _ready() -> void:
	GameManager.player = self


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if (Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("ui_up")) and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		if Input.is_action_pressed("shift"):
			velocity.x = direction * RUN_SPEED
		else:
			velocity.x = direction * SPEED
		
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	update_animations(direction)
	
func update_animations(input_axis):
	if velocity.y < 0:
		sprite_2d.play("Jump")
	elif velocity.y > 0:
		sprite_2d.play("Fall")
	elif input_axis != 0:
		if Input.is_action_pressed("shift"):
			sprite_2d.play("Run")
		else:
			sprite_2d.play("Walk")
	else:
		sprite_2d.play("Idle")
		
	if input_axis < 0:
		sprite_2d.flip_h = true
	elif input_axis > 0:
		sprite_2d.flip_h = false
		
func die():
	GameManager.respawn_player()
