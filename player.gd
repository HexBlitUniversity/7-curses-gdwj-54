extends CharacterBody2D

@onready var sprite = $Sprite2D

const SPEED = 150.0

func _physics_process(delta):
	# Add the gravity.
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector.x < 0:
		sprite.flip_h = true
	elif input_vector.x > 0:
		sprite.flip_h = false
	velocity = input_vector * SPEED

	var collision = move_and_collide(velocity * delta)

	if collision:
		velocity = Vector2.ZERO
