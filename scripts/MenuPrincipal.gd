extends Node2D

func _ready():
	var style = StyleBoxFlat.new()
	var color = Color(138,221,45,0)
	style.set_bg_color(color)
	$Button.set("custom_styles/normal", style)
	$Button.set("custom_styles/hover", style)
	$Button.set("custom_styles/pressed", style)
	$Button2.set("custom_styles/normal", style)
	$Button2.set("custom_styles/hover", style)
	$Button2.set("custom_styles/pressed", style)


func _on_Button_pressed():
	get_tree().change_scene("res://scenes/Level 1.tscn")


func _on_Button2_pressed():
	get_tree().change_scene("res://scenes/Keys.tscn")
