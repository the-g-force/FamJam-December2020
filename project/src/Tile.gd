extends StaticBody2D

func _process(_delta):
	if position.x + $CollisionShape2D.shape.extents.x*2 < 0:
		queue_free()


func width()->float:
	return 100.0
