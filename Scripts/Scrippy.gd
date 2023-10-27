extends Node2D

var country_name: String = "Frogstead"
var population: int = 43153986
var altitude_max: float = 2002.54
var landlocked: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Country name: %s" % country_name)
	print("Population: %d" % population)
	print("Maximum altitude: %f" % altitude_max)
	print("Is landlocked: %s" % landlocked)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
