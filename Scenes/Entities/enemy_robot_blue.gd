extends Area2D

@export var move_speed : float 
@export var move_direction : Vector2

@onready var animated_Sprite = $AnimatedSprite2D

var start_position : Vector2
var target_position : Vector2

func _ready():
	start_position = global_position
	target_position = global_position + move_direction
	animated_Sprite.play("default")

func _process(delta):
	global_position = global_position.move_toward(target_position, move_speed * delta)
	
	if global_position == target_position:
		if global_position == start_position:
			target_position = start_position + move_direction
		else:
			target_position = start_position
	
	if target_position.x > start_position.x:
		animated_Sprite.flip_h = true

func _on_body_entered(body):
	if body.is_in_group("Player"):
		body.game_over()
