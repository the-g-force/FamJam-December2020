extends StaticBody2D

# Remove the tile when it is offscreen
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
