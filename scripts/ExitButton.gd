extends Button

func _ready():
	var style = StyleBoxFlat.new()
	var color = Color(138,221,45,0)
	style.set_bg_color(color)
	set("custom_styles/normal", style)
	set("custom_styles/hover", style)
	set("custom_styles/pressed", style)


func _on_Button_pressed():
	get_tree().change_scene("res://scenes/MenuPrincipal.tscn")
