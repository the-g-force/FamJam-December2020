extends Area2D

func _draw():
	draw_rect(Rect2(0,0, $CollisionShape2D.shape.extents.x, $CollisionShape2D.shape.extents.y), Color.yellow)
