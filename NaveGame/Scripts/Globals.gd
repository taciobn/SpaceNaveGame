extends Node

var matrix = []
var width = 100
var intMax = 30

func _ready():
	for x in range(width):
			matrix.append([])
			for y in range(width):
				matrix[x].append([])
				for z in range(randi()%intMax) :
					matrix[x][y].append([])
					matrix[x][y][z].append(randi()%1020)
					matrix[x][y][z].append(randi()%590)
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
