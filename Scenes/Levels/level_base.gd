extends Node2D

@onready var audio_background = $BackgroundMusic

# Called when the node enters the scene tree for the first time.
func _ready():
	audio_background.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
