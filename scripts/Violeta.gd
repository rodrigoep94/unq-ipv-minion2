extends KinematicBody2D

class_name Violeta

# Player movement speed
const SPEED = 75
const JUMP_POWER = -100
const GRAVITY = 10
const FLOOR = Vector2(0, -1)

var max_jumping_position = 0
var numbers = {
	"1" : 49,
	"2" : 50,
	"3" : 51,
	"4" : 52,
	"5" : 53,
	"6" : 54,
	"7" : 55,
	"8" : 56,
	"9" : 57
}

export var velocity = Vector2()

var caja: RigidBody2D
var history = []
var state: Object

func _ready():
	state = $Walk
	_enter_state()

func change_to(new_state):
	history.append(state.name)
	state = get_node(new_state)
	_enter_state()
	
func back():
	if history.size() > 0:
		state = get_node(history.pop_back())
		_enter_state()

func _enter_state():
	state.fsm = self
	
func _physics_process(delta): 
	if Input.is_action_pressed("ui_up") && !is_jumping():
		max_jumping_position = position.y - 30
		$JumpSound.play()
		change_to("Jump")
		
	if state.has_method("physics_process"):
		state.physics_process(delta)

func is_jumping():
	return state.name == "Jump" || state.name == "Idle"

func is_about_to_win():
	return state.name == "InPolygon"	

func _input(event):
	if caja == null && numbers.has(event.as_text()):
		caja = get_node("../Caja" + event.as_text())
		
	if caja != null && event is InputEventKey && !is_jumping() && !is_about_to_win():
		var just_pressed = event.is_pressed()
		if (!$LevitationSound.playing):
			$LevitationSound.play()
			
		if numbers.has(event.as_text()) && event.scancode == numbers[event.as_text()] && just_pressed:
			caja.set_mode(RigidBody2D.MODE_CHARACTER)
			caja.set_linear_velocity(Vector2(0,-60))
		elif event.as_text() == "K":
			velocity = (self.position-caja.position) * 0.3
			caja.apply_impulse(velocity, -velocity)
			caja.estoy_levitando = false
			caja = null
		elif event.as_text() == "L":
			velocity = self.position-caja.position
			caja.apply_impulse(-velocity, velocity)
			caja.estoy_levitando = false
			caja = null
		else:
			print("Bajo")
			caja = null
