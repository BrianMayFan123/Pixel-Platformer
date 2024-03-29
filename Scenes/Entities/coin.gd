extends Area2D

@onready var animated_Sprite = $AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	animated_Sprite.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.is_in_group("Player"):
		SoundPlayer.play_sound(SoundPlayer.COIN)
		queue_free()
