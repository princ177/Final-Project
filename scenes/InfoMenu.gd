extends Area3D

#var size = .1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var size = %RightController.object_size
	$PlaneMesh/SubViewport/CanvasLayer/BallSizeLabel/Size.text = str(size*100).pad_decimals(1)
	
	var weight = %RightController.object_weight
	$PlaneMesh/SubViewport/CanvasLayer/WeightSizeLabel/Weight.text = str(weight)
	
	var current_strike = $"../XRUser/XROrigin3D/LeftController/SpatialMenu".strike_counter
	$PlaneMesh/SubViewport/CanvasLayer/StrikesLabel/Strikes.text = str(current_strike)
	
	var current_pins = $"../XRUser/XROrigin3D/LeftController/SpatialMenu".pins_knocked
	$PlaneMesh/SubViewport/CanvasLayer/ThrowLabel/Pins.text = str(current_pins)
	
func test():
	pass
