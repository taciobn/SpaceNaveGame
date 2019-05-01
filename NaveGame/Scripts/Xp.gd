extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var xpPonints = 1
var index = Vector3()

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Xp_area_entered(area):
	if area.is_in_group("STATE"):
		area.get_parent().get_parent().xp +=xpPonints
		Globals.matrix[index.x][index.y].remove(index.z)
		print(Globals.matrix[index.x][index.y])
		queue_free()
		get_parent().clean_screan()
		get_parent().genarate_screan(get_parent().positionNave.x,get_parent().positionNave.y)
		
	pass 
