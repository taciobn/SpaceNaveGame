extends Node

var cursor = load("res://Sprites/ddddd.png")
var matrix = Globals.matrix
var width = Globals.width
var intMax = 30
var positionNave  = Vector2(int(width/2),int(width/2))
var pre_xp = preload("res://Scenes/Xp.tscn")
onready var lifeBarMaxSize = get_node("Control/LifeConteiner/LifeBar").rect_size


func _ready():
	Input.set_custom_mouse_cursor(cursor,0,Vector2(16,16))
	genarate_screan(positionNave.x,positionNave.y)

	pass

func _process(delta):
	
	if has_node("Player"):
		if $Player.global_position.x <0 :
			muve_in_grid(Vector2(-1,0))
		if $Player.global_position.y <0:
			muve_in_grid(Vector2(0,-1))
		if $Player.global_position.x >1024 :
			muve_in_grid(Vector2(1,0))
		if $Player.global_position.y >600 :
			muve_in_grid(Vector2(0,1))
		life_bar_att()
	
	pass

func clean_shot():
	for child in get_children():
		if child.is_in_group("SHOT"):
			child.queue_free()
	pass
	
func clean_screan():
	for child in get_children():
		if child.is_in_group("XP"):
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
		clean_shot()
		genarate_screan(positionNave.x,positionNave.y)
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
func genarate_screan(x,y):
	var quantidateDeXp = matrix[x][y].size()
	for z in range(quantidateDeXp):
		var xp = pre_xp.instance()
		xp.position = Vector2( matrix[x][y][z][0], matrix[x][y][z][1])
		xp.index = Vector3(x,y,z)
		add_child(xp)
	pass
func life_bar_att():
	var lifeBar =  get_node("Control/LifeConteiner/LifeBar")
	
	lifeBar.rect_size.x = (lifeBarMaxSize.x/100)*((Globals.playerLifeMax/100)*Globals.playerLife)
	
	pass
