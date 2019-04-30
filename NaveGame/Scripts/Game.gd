extends Node

var cursor = load("res://Sprites/ddddd.png")
var matrix = []
var width = 100
var intMax = 30
var positionNave  = Vector2(int(width/2),int(width/2))
var pre_xp = preload("res://Scenes/Xp.tscn")



func _ready():
	Input.set_custom_mouse_cursor(cursor,0,Vector2(16,16))
	
	for x in range(width):
    	matrix.append([])
	    for y in range(width):
        	matrix[x].append(randi()%intMax)
	genarate_screan(matrix[positionNave.x][positionNave.y])
	print("position Nave :"+str(positionNave))
	print("position Value :" + str(matrix[positionNave.x][positionNave.y]))

	pass

func _process(delta):
	if $Player.global_position.x <0 :
		muve_in_grid(Vector2(-1,0))
	if $Player.global_position.y <0:
		muve_in_grid(Vector2(0,-1))
	if $Player.global_position.x >1024 :
		muve_in_grid(Vector2(1,0))
	if $Player.global_position.y >600 :
		muve_in_grid(Vector2(0,1))
	pass

func clean_screan():
	for child in get_children():
		if child.is_in_group("SCREAN"):
			child.queue_free()
	
	pass

func _on_AreaScrean_area_exited(area):
	if area.is_in_group("SHOT"):
		area.queue_free()
		pass
	pass # replace with function body
func muve_in_grid(vector):
	if !((positionNave.x == 0 && vector.x == -1)|| (positionNave.y == 0 && vector.y == -1)||(positionNave.x == width-1 && vector.x == 1)|| (positionNave.y == width-1 && vector.y == 1)):
		positionNave += vector
		if vector.x > 0:
			$Player.global_position.x = 0
		if vector.x < 0:
			$Player.global_position.x = 1024
		if vector.y > 0:
			$Player.global_position.y = 0
		if vector.y < 0:
			$Player.global_position.y = 600
		clean_screan()
		genarate_screan(matrix[positionNave.x][positionNave.y])
	else :
		if vector.x > 0:
			$Player.global_position.x = 1024
		if vector.x < 0:
			$Player.global_position.x = 0
		if vector.y > 0:
			$Player.global_position.y = 600
		if vector.y < 0:
			$Player.global_position.y = 0
	print(positionNave)
	pass
func genarate_screan(num):
	for i in range(num) :
		var xp = pre_xp.instance()
		xp.position = Vector2(randi()%1020,randi()%590)
		add_child(xp)
	pass