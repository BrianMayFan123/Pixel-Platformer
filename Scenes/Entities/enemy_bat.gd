extends Area2D

@export var move_speed : float 
@export var move_direction : Vector2

@onready var animated_Sprite = $AnimatedSprite2D

var start_position : Vector2
var target_positon : Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	start_position = global_position
	target_positon = global_position + move_direction
	animated_Sprite.play("default")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position = global_position.move_toward(target_positon, move_speed * delta)
	
	if global_position == target_positon:
		if global_position == start_position:
			target_positon = start_position + move_direction
		else:
			target_positon = start_position

func _on_body_entered(body):
	if body.is_in_group("Player"):
		body.game_over()
