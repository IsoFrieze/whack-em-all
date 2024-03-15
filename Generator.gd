extends Node2D

@onready var root = $"."
@onready var points = $Points
var rng: RandomNumberGenerator = RandomNumberGenerator.new()

# reference to the current object on screen
var current_item: Node

# number of objects killed
var kill_count: int = 0

# distance from edge of screen to spawn objects
var BUFFER: int = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	generate_item()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
# Called when the current_item is killed
func _on_clickme_killed():
	# remove this one
	root.remove_child(current_item)
	# add a new one
	generate_item()
	
	# update kill count
	kill_count += 1
	points.text = str("Points: ", kill_count)
	
	pass

# create a new object to click
func generate_item():
	# load the scene
	var scene: PackedScene = load("res://ClickMe.tscn") 
	current_item = scene.instantiate()
	# add it to the tree
	root.add_child(current_item)
	
	# give random position on screen
	current_item.position.x = rng.randi_range(BUFFER, get_viewport_rect().size.x - BUFFER)
	current_item.position.y = rng.randi_range(BUFFER, get_viewport_rect().size.y - BUFFER)
	
	# connect to killed signal so we can tell when it dies
	current_item.killed.connect(_on_clickme_killed)
	
	pass
