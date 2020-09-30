extends StaticBody2D


var can_move_up = false
var can_move_down = false
var bodies = []
var plataformas_a_mover = []
var primary = true

func _process(delta):
	if can_move_up:
		if primary:
			position.y += 0.3
			for p in plataformas_a_mover:
				p.position.y -= 0.3
	if can_move_down:
		if primary:
			position.y -= 0.3
			for p in plataformas_a_mover:
				p.position.y += 0.3

func _on_Area2D_body_shape_entered(body_id, body, body_shape, area_shape):
	if body.name.begins_with("Caja") && !bodies.has(body.name) && primary:
		print("Entró " + body.name)
		bodies.append(body.name)
		can_move_up = true
		$Up.start()

func _on_Up_timeout():
	can_move_up = false


func _on_Area2D_body_shape_exited(body_id, body, body_shape, area_shape):
	if !can_move_up && body.name.begins_with("Caja") && bodies.has(body.name) && primary:
		print("Salió " + body.name)
		bodies.erase(body.name)
		can_move_down = true
		$Down.start()


func _on_Down_timeout():
	can_move_down = false
