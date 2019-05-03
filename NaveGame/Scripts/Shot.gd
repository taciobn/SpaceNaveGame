extends Area2D

var vel = 500
var dir = Vector2()
var damage = 25
func _ready():

	pass

func _process(delta):
	global_position = global_position+vel*dir*delta

	pass



	
	pass # replace with function body
