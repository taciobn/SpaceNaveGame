extends Area2D

var vel = 500
var dir = Vector2()

func _ready():

	pass

func _process(delta):
	global_position = global_position+vel*dir*delta

	pass
