extends Area2D

func start_animation():
	$Sprite.play("moving")
	$Sprite.playing = true

func end_animation():
	$Sprite.play("idle")
	$Sprite.playing = false
	
func dissapear():
	$Sprite.play("dissapear")
	$Sprite.playing = true
