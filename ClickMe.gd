extends CharacterBody2D

# signal for when the object is clicked
signal killed

@onready var collision = $CollisionPolygon2D

# input event when object is clicked
func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed:
			killed.emit()

func _physics_process(delta):
	pass
