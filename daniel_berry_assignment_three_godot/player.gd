extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -300.0

@onready var sprite_2d: AnimatedSprite2D = $Sprite2D



func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	update_animations(direction)
	
func update_animations(input_axis):
	if input_axis != 0:
		sprite_2d.play("Walk")
	else:
		sprite_2d.play("Idle")
		
	if input_axis < 0:
		sprite_2d.flip_h = true
	elif input_axis > 0:
		sprite_2d.flip_h = false
