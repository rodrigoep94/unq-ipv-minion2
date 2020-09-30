extends Node2D

var puedeAvanzar = false

func _ready():
	$Hint.visible = true
	$Timer.start()
	$Caja1.posibles_colisiones.append("Floor")
	$Caja2.posibles_colisiones.append("Floor")
	$PolygonStart.dissapear()
	
func _input(event):
		if Input.is_action_just_pressed("ui_select") && puedeAvanzar:
			get_tree().change_scene("res://scenes/Level 3.tscn")


func _on_PolygonEnd_body_entered(body):
	if body.name == "Violeta":
		$PolygonEnd.start_animation()
		$AvanzarLbl.visible = true
		$Violeta.change_to("InPolygon")
		puedeAvanzar = true


func _on_PolygonEnd_body_exited(body):
	if body.name == "Violeta":
		$Violeta.change_to("Walk")
		$PolygonEnd.end_animation()
		puedeAvanzar = false
		$AvanzarLbl.visible = false


func _on_RestartButton_pressed():
	get_tree().reload_current_scene()


func _on_Timer_timeout():
	$Hint.visible = false
