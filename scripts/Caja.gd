extends RigidBody2D

const FLOOR = Vector2(0, -1)
export var estoy_levitando = false
export var estoy_en_impulso = false

var posibles_colisiones = []

func _ready():
	contact_monitor = true
	contacts_reported = 20

func aplicar_impulso(pos, neg):
	estoy_en_impulso = true
	var velocity = Vector2(0, 70)
	if neg:
		set_linear_velocity(Vector2(0,0))
		apply_impulse(-velocity, velocity)
	else:
		set_linear_velocity(Vector2(0,0))
		apply_impulse(velocity, -velocity)
	estoy_levitando = false
	
func _process(delta):
	var colisiones = get_colliding_bodies()
	for i in colisiones:
		if posibles_colisiones.has(i.name) && !estoy_levitando:
			set_mode(RigidBody2D.MODE_STATIC)
