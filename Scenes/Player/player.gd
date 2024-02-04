extends CharacterBody2D


const SPEED = 200.0
const ACCELERATION = 600.0
const FRICTION = 1000.0
const JUMP_VELOCITY = -350.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animated_Sprite = $AnimatedSprite2D
@onready var audio_Jump = $AudioStreamPlayer2D

func _physics_process(delta):
	
	var direction = Input.get_axis("left", "right")
	
	apply_gravity(delta)
	handle_jump()
	handle_animations(direction)
	
	if direction != 0 :
		velocity.x = move_toward(velocity.x, SPEED * direction, ACCELERATION * delta)
	else:
		velocity.x = move_toward(velocity.x, 0 , FRICTION * delta)

	move_and_slide()
	
	if position.y > 390:
		game_over()


func apply_gravity(delta):
		if not is_on_floor():
			velocity.y += gravity * delta


func handle_jump():
		if is_on_floor():
			if Input.is_action_just_pressed("jump") and is_on_floor():
				velocity.y = JUMP_VELOCITY
				audio_Jump.play()
		else: 
			if Input.is_action_just_released("jump") and velocity.y < JUMP_VELOCITY / 2:
				velocity.y = JUMP_VELOCITY / 2

func game_over():
	get_tree().reload_current_scene()

func handle_animations(direction):
	if direction != 0 :
		animated_Sprite.flip_h = (direction > 0)
		animated_Sprite.play("run")
	else:
		animated_Sprite.play("idle")
	
	if not is_on_floor():
		animated_Sprite.flip_h = (direction > 0)
		animated_Sprite.play("jump")
