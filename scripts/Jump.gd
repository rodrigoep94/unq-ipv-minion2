extends Node

class_name Jump

var fsm: Violeta

func physics_process(delta):
	fsm.velocity.y = fsm.JUMP_POWER
	fsm.velocity.y += fsm.GRAVITY
	
	if fsm.position.y < fsm.max_jumping_position:
		exit()

func exit():
	fsm.change_to("Idle")
