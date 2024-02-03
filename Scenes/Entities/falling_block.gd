extends AnimatableBody2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if global_position.y > 500:
		queue_free()


func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		move_block()

func move_block():
	move_toward(global_position.y, global_position.y + 400,100)
