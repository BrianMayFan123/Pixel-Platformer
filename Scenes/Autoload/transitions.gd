extends CanvasLayer

@onready var colorRect = $ColorRect
@onready var animationPlayer = $AnimationPlayer

func _ready():
	colorRect.visible = false

func play_fadeIn():
	colorRect.visible = true
	animationPlayer.play("FadeIn")
	

func play_fadeOut():
	colorRect.visible = true
	animationPlayer.play("FadeOut")
	
