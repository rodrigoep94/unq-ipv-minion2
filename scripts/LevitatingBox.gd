extends Node

class_name LevitatingBox

var fsm: Violeta

func _input(event):
	if fsm != null && fsm.caja != null:
		fsm.levitar_caja()
