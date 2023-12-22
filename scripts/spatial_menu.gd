extends Node


var current_strike = false
@export var strike_counter: int = 0
@export var pins_knocked: int = 0
var bumper_status = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if $"../../../../Bowling Pins/Bowling Pin 1/RayCast3D".get_collider() == $"../../../../RigidBody3DTest":
	#	print("hey there")
	var pin_counter = 0

	#print($"../Bowling Pins".get_children())
	for child in $"../../../../Bowling Pins".get_children():
		#print(child.get_child(3))
		var pin_raycast = child.get_child(3).get_collider()
		if pin_raycast != $"../../../../Layout/RigidBody3DTest":
			pin_counter += 1
	pins_knocked = pin_counter
	#print(pins_knocked)
	if pins_knocked == 10 && !current_strike:
		strike_counter += 1
		current_strike = true
		
	if pins_knocked == 10 && !current_strike:
		strike_counter += 1
		current_strike = true

# prob doesn't work so test it
func toggle_bumpers():
	if bumper_status:
		$"../../../../Layout/Right Bumper".global_position.y = -0.16
		$"../../../../Layout/Left Bumper".global_position.y = -0.16
		bumper_status = !bumper_status
	else:
		$"../../../../Layout/Right Bumper".global_position.y = 0.1
		$"../../../../Layout/Left Bumper".global_position.y = 0.1
		bumper_status = !bumper_status

func reset_all_button():
	print("Reseting all")
	
	$"../../../../Big Ball".freeze = true
	$"../../../../Big Ball".global_position = Vector3(1.1, .8, -.95)
	$"../../../../Big Ball".rotation = Vector3(0, 180,-120)
	$"../../../../Big Ball".freeze = false

	$"../../../../Bowling Pins/Bowling Pin 1".freeze = true
	$"../../../../Bowling Pins/Bowling Pin 1".global_position = Vector3(-0.3, 0.2, -20.5)
	$"../../../../Bowling Pins/Bowling Pin 1".global_rotation = Vector3.ZERO
	$"../../../../Bowling Pins/Bowling Pin 1".freeze = false
	
	$"../../../../Bowling Pins/Bowling Pin 2".freeze = true
	$"../../../../Bowling Pins/Bowling Pin 2".global_position = Vector3(-0.15, 0.2, -20.5)
	$"../../../../Bowling Pins/Bowling Pin 2".global_rotation = Vector3.ZERO
	$"../../../../Bowling Pins/Bowling Pin 2".freeze = false
	
	$"../../../../Bowling Pins/Bowling Pin 3".freeze = true
	$"../../../../Bowling Pins/Bowling Pin 3".global_position = Vector3(0.0, 0.2, -20.5)
	$"../../../../Bowling Pins/Bowling Pin 3".global_rotation = Vector3.ZERO
	$"../../../../Bowling Pins/Bowling Pin 3".freeze = false
	
	$"../../../../Bowling Pins/Bowling Pin 4".freeze = true
	$"../../../../Bowling Pins/Bowling Pin 4".global_position = Vector3(0.15, 0.2, -20.5)
	$"../../../../Bowling Pins/Bowling Pin 4".global_rotation = Vector3.ZERO
	$"../../../../Bowling Pins/Bowling Pin 4".freeze = false
	
	$"../../../../Bowling Pins/Bowling Pin 5".freeze = true
	$"../../../../Bowling Pins/Bowling Pin 5".global_position = Vector3(-0.2, 0.2, -20.35)
	$"../../../../Bowling Pins/Bowling Pin 5".global_rotation = Vector3.ZERO
	$"../../../../Bowling Pins/Bowling Pin 5".freeze = false
	
	$"../../../../Bowling Pins/Bowling Pin 6".freeze = true
	$"../../../../Bowling Pins/Bowling Pin 6".global_position = Vector3(-0.05, 0.2, -20.35)
	$"../../../../Bowling Pins/Bowling Pin 6".global_rotation = Vector3.ZERO
	$"../../../../Bowling Pins/Bowling Pin 6".freeze = false
	
	$"../../../../Bowling Pins/Bowling Pin 7".freeze = true
	$"../../../../Bowling Pins/Bowling Pin 7".global_position = Vector3(0.1, 0.2, -20.35)
	$"../../../../Bowling Pins/Bowling Pin 7".global_rotation = Vector3.ZERO
	$"../../../../Bowling Pins/Bowling Pin 7".freeze = false
	
	$"../../../../Bowling Pins/Bowling Pin 8".freeze = true
	$"../../../../Bowling Pins/Bowling Pin 8".global_position = Vector3(-0.125, 0.2, -20.2)
	$"../../../../Bowling Pins/Bowling Pin 8".global_rotation = Vector3.ZERO
	$"../../../../Bowling Pins/Bowling Pin 8".freeze = false
	
	$"../../../../Bowling Pins/Bowling Pin 9".freeze = true
	$"../../../../Bowling Pins/Bowling Pin 9".global_position = Vector3(0.025, 0.2, -20.2)
	$"../../../../Bowling Pins/Bowling Pin 9".global_rotation = Vector3.ZERO
	$"../../../../Bowling Pins/Bowling Pin 9".freeze = false
	
	$"../../../../Bowling Pins/Bowling Pin 10".freeze = true
	$"../../../../Bowling Pins/Bowling Pin 10".global_position = Vector3(-0.05, 0.2, -20.05)
	$"../../../../Bowling Pins/Bowling Pin 10".global_rotation = Vector3.ZERO
	$"../../../../Bowling Pins/Bowling Pin 10".freeze = false
	
	current_strike = false
	
func reset_pins_button():
	print("Reseting pins")
	$"../../../../Bowling Pins/Bowling Pin 1".freeze = true
	$"../../../../Bowling Pins/Bowling Pin 1".global_position = Vector3(-0.3, 0.2, -20.5)
	$"../../../../Bowling Pins/Bowling Pin 1".global_rotation = Vector3.ZERO
	$"../../../../Bowling Pins/Bowling Pin 1".freeze = false
	
	$"../../../../Bowling Pins/Bowling Pin 2".freeze = true
	$"../../../../Bowling Pins/Bowling Pin 2".global_position = Vector3(-0.15, 0.2, -20.5)
	$"../../../../Bowling Pins/Bowling Pin 2".global_rotation = Vector3.ZERO
	$"../../../../Bowling Pins/Bowling Pin 2".freeze = false
	
	$"../../../../Bowling Pins/Bowling Pin 3".freeze = true
	$"../../../../Bowling Pins/Bowling Pin 3".global_position = Vector3(0.0, 0.2, -20.5)
	$"../../../../Bowling Pins/Bowling Pin 3".global_rotation = Vector3.ZERO
	$"../../../../Bowling Pins/Bowling Pin 3".freeze = false
	
	$"../../../../Bowling Pins/Bowling Pin 4".freeze = true
	$"../../../../Bowling Pins/Bowling Pin 4".global_position = Vector3(0.15, 0.2, -20.5)
	$"../../../../Bowling Pins/Bowling Pin 4".global_rotation = Vector3.ZERO
	$"../../../../Bowling Pins/Bowling Pin 4".freeze = false
	
	$"../../../../Bowling Pins/Bowling Pin 5".freeze = true
	$"../../../../Bowling Pins/Bowling Pin 5".global_position = Vector3(-0.2, 0.2, -20.35)
	$"../../../../Bowling Pins/Bowling Pin 5".global_rotation = Vector3.ZERO
	$"../../../../Bowling Pins/Bowling Pin 5".freeze = false
	
	$"../../../../Bowling Pins/Bowling Pin 6".freeze = true
	$"../../../../Bowling Pins/Bowling Pin 6".global_position = Vector3(-0.05, 0.2, -20.35)
	$"../../../../Bowling Pins/Bowling Pin 6".global_rotation = Vector3.ZERO
	$"../../../../Bowling Pins/Bowling Pin 6".freeze = false
	
	$"../../../../Bowling Pins/Bowling Pin 7".freeze = true
	$"../../../../Bowling Pins/Bowling Pin 7".global_position = Vector3(0.1, 0.2, -20.35)
	$"../../../../Bowling Pins/Bowling Pin 7".global_rotation = Vector3.ZERO
	$"../../../../Bowling Pins/Bowling Pin 7".freeze = false
	
	$"../../../../Bowling Pins/Bowling Pin 8".freeze = true
	$"../../../../Bowling Pins/Bowling Pin 8".global_position = Vector3(-0.125, 0.2, -20.2)
	$"../../../../Bowling Pins/Bowling Pin 8".global_rotation = Vector3.ZERO
	$"../../../../Bowling Pins/Bowling Pin 8".freeze = false
	
	$"../../../../Bowling Pins/Bowling Pin 9".freeze = true
	$"../../../../Bowling Pins/Bowling Pin 9".global_position = Vector3(0.025, 0.2, -20.2)
	$"../../../../Bowling Pins/Bowling Pin 9".global_rotation = Vector3.ZERO
	$"../../../../Bowling Pins/Bowling Pin 9".freeze = false
	
	$"../../../../Bowling Pins/Bowling Pin 10".freeze = true
	$"../../../../Bowling Pins/Bowling Pin 10".global_position = Vector3(-0.05, 0.2, -20.05)
	$"../../../../Bowling Pins/Bowling Pin 10".global_rotation = Vector3.ZERO
	$"../../../../Bowling Pins/Bowling Pin 10".freeze = false
	
	current_strike = false
	
func reset_balls_button():
	print("Reseting balls")
	
	$"../../../../Big Ball".freeze = true
	$"../../../../Big Ball".global_position = Vector3(1.1, .8, -.95)
	$"../../../../Big Ball".rotation = Vector3(0, 0, 0)
	$"../../../../Big Ball".freeze = false
	
	current_strike = false
