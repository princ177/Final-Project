extends Node3D

# Make sure throwing works???
# Check to make sure all the wights are able to knock down pins


@export var object_size: float =  .1
@export var object_weight: int = 50

var grabbed_object: RigidBody3D = null
var previous_transform: Transform3D

var throw_force: float = 500.0  # Adjust this value based on your needs
var maxAngularVelocity: float = 10.0  # Adjust this value based on your needs
var to_scale = "size" #on trigger click it will change between being able to scale the weight and size of the bowlingball

var size_min = .5
var size_max = 1.5

#in kilograms
var weight_min = 10
var weight_max = 100

var grab_status = false

var initial_velocity = 10

var friction = 0.5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):

	
	# Copy the grabber's relative movement since the last frame to to the grabbed object
	if self.grabbed_object:
		self.grabbed_object.transform = self.transform * self.previous_transform.inverse() * self.grabbed_object.transform

	self.previous_transform = self.transform

func process_input(input_name: String):
	if input_name == "trigger_click" && self.grabbed_object:
		if to_scale == "size":
			
			to_scale = "weight"
		else:
			to_scale = "size"
		
func scale_up(input_name: String):
	if input_name == "ax_button" && self.grabbed_object && to_scale == "size":
		var sphere_mesh = self.grabbed_object.get_child(0)
		var collision_shape = self.grabbed_object.get_child(1)
		if sphere_mesh.scale.x < size_max:
			sphere_mesh.scale += Vector3(.1, .1, .1)
			collision_shape.scale += Vector3(.1, .1, .1)
			object_size *= 1.1
	if input_name == "ax_button" && self.grabbed_object && to_scale == "weight":
		if self.grabbed_object.mass < weight_max:
			self.grabbed_object.mass += 10
			object_weight += 10
			initial_velocity -= 1 

	
func scale_down(input_name: String):
	if input_name == "by_button" && self.grabbed_object && to_scale == "size":
		var sphere_mesh = self.grabbed_object.get_child(0)
		var collision_shape = self.grabbed_object.get_child(1)
		if sphere_mesh.scale.x > size_min:
			sphere_mesh.scale -= Vector3(.1, .1, .1)
			collision_shape.scale -= Vector3(.1, .1, .1)
			object_size /= 1.1
	if input_name == "by_button" && self.grabbed_object && to_scale == "weight":
		if self.grabbed_object.mass > weight_min:
			self.grabbed_object.mass -= 10
			object_weight -= 10
			initial_velocity += 1



func _on_button_pressed(button_name: String) -> void:
	# Stop if we have not clicked the grip button or we already are grabbing an object
	if button_name != "grip_click" || self.grabbed_object != null:
		return
	
	#initial_velocity = 10
	var grabbables = get_tree().get_nodes_in_group("grabbable")
	var collision_area = $Area3D as Area3D

	# Iterate through all grabbable objects and check if the collision area overlaps with them
	for grabbable in grabbables:
		# Cast the grabbable object to a RigidBody3D
		var grabbable_body = grabbable as RigidBody3D
		# Check to see if the grabber and grabbable collision shapes are intersecting
		if collision_area.overlaps_body(grabbable_body):
			# If the object is already grabbed by another grabber, release it first
			var globals = get_node("/root/Globals")
			for grabber in globals.active_grabbers:
				if grabber.grabbed_object == grabbable_body:
					grabber.grabbed_object = null
					globals.active_grabbers.remove_at(globals.active_grabbers.find(self))
					break
			grabbable_body.freeze = true
			self.grabbed_object = grabbable_body
			globals.active_grabbers.push_back(self)



	
func _on_button_released(button_name: String) -> void:
	# Stop if we have not clicked the grip button or we have no current grabbed object
	if button_name != "grip_click" || self.grabbed_object == null:
		return
	
	# Release the grabbed object and unfreeze it
	self.grabbed_object.freeze = false
	self.grabbed_object.linear_velocity = Vector3(0, 0, 0)
	self.grabbed_object.angular_velocity = Vector3.ZERO
	# Calculate the throw direction based on the controller orientation
	var throw_direction = -global_transform.basis.z.normalized()
	#var initial_velocity = 10.0
	self.grabbed_object.linear_velocity = throw_direction * initial_velocity
	self.grabbed_object = null
	# Remove this grabber from the array of active grabbers
	var globals = get_node("/root/Globals")
	globals.active_grabbers.remove_at(globals.active_grabbers.find(self))
	grab_status = !grab_status
	print(initial_velocity)
	
func open_menu(button_name: String) -> void:	
	if button_name == "trigger_click":
		$SpatialMenu.visible = !$SpatialMenu.visible
		$"../RightController/LaserPointer".visible = !$"../RightController/LaserPointer".visible
