extends Node2D

var puedeAvanzar = false

func _ready():
	$Caja1.posibles_colisiones.append("Floor")
	$Caja2.posibles_colisiones.append("Floor")
	$PolygonStart.dissapear()
	
func _input(event):
	if Input.is_action_just_pressed("ui_select") && puedeAvanzar:
		get_tree().change_scene("res://scenes/Level 4.tscn")

func _on_PolygonEnd_body_entered(body):
	if body.name == "Violeta":
		$Violeta.change_to("InPolygon")
		$PolygonEnd.start_animation()
		$AvanzarLbl.visible = true
		puedeAvanzar = true


func _on_PolygonEnd_body_exited(body):
	if body.name == "Violeta":
		$Violeta.change_to("Walk")
		$PolygonEnd.end_animation()
		puedeAvanzar = false
		$AvanzarLbl.visible = false


func _on_RestartButton_pressed():
	get_tree().reload_current_scene()
