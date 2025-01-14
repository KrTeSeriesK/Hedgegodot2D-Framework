extends Area2D

tool

enum Angle {LEFT, UP, RIGHT, DOWN}

export(Angle) var angle = 0 setget set_angle

func _ready():
	pass

func _on_UnsnapGround_body_entered(body):
	if body is PlayerPhysics:
		print(body.rotation, " ", -rotation)
		if !is_equal_approx(body.rotation, -rotation): return
		body.speed += Vector2(sin(rotation), cos(rotation)) * 100
		(body as PlayerPhysics).fsm.change_state('OnAir')
		body.move_and_slide_preset()


func _draw():
	draw_line(Vector2.ZERO, Vector2(0, 1) * 10, Color(0xff0000cc), 2.0)

func set_angle(val : int) -> void:
	angle = val
	set_rotation(-TAU + angle * PI)
