extends Node

class_name Idle

var fsm: Violeta

func _physics_process(delta):
	if fsm != null && fsm.is_on_floor():
		fsm.change_to("Walk")
