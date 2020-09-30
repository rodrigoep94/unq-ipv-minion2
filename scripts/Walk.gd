extends Node

class_name Walk

var fsm: Violeta

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		fsm.velocity.x = fsm.SPEED
	elif Input.is_action_pressed("ui_left"):
		fsm.velocity.x = -fsm.SPEED
	else:
		fsm.velocity.x = 0		
	fsm.velocity.y += fsm.GRAVITY
			
	fsm.move_and_slide(fsm.velocity, fsm.FLOOR)
