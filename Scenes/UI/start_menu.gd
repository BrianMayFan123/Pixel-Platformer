extends CenterContainer

@onready var start_Menu_Button = $VBoxContainer/StartButton

# Called when the node enters the scene tree for the first time.
func _ready():
	start_Menu_Button.grab_focus()


func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/level_1.tscn")


func _on_quit_button_pressed():
	get_tree().quit()
	
	
	
