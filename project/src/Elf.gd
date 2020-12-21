extends KinematicBody2D

export var GRAVITY := 350

var _velocity := Vector2.ZERO

func _physics_process(delta:float):
	_velocity.y += GRAVITY * delta
	
	var y_direction := -1 if is_on_floor() and Input.is_action_just_pressed("jump") else 0
	
	_velocity.y += y_direction * 400
	
	move_and_slide(_velocity, Vector2.UP)


func _draw():
	var box := Rect2(Vector2.ZERO, Vector2($CollisionShape2D.shape.extents.x, $CollisionShape2D.shape.extents.y))
	draw_rect(box, Color.green)
