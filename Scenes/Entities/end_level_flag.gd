extends Area2D

@export var next_Level: PackedScene
@onready var animated_Sprite = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	animated_Sprite.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.is_in_group("Player"):
		await(Transitions.play_fadeIn())
		get_tree().change_scene_to_packed(next_Level)
