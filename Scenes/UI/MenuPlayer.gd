extends CharacterBody2D

@onready var animatedSprite = $AnimatedSprite2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	var direction = 1
	
	if direction > 0:
		animatedSprite.flip_h = (direction > 0)
		animatedSprite.play("run")
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if position.x > 2000:
		position.x = -210
	
	move_and_slide()
