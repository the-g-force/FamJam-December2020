extends KinematicBody2D

export var GRAVITY := 900
export var jump_power := 500

# The amount by which the upward velocity is scaled if the jump
# button is released.
export var short_jump_velocity_scale := 0.4

var _velocity := Vector2.ZERO

func _physics_process(delta:float):
	_velocity.y += GRAVITY * delta
	
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		_velocity.y = -jump_power
		
	if _velocity.y < 0.0 and Input.is_action_just_released("jump"):
		_velocity.y *= short_jump_velocity_scale
	
	move_and_slide(_velocity, Vector2.UP)


func _draw():
	var box := Rect2(Vector2.ZERO, Vector2($CollisionShape2D.shape.extents.x, $CollisionShape2D.shape.extents.y))
	draw_rect(box, Color.green)
