extends KinematicBody2D
var vel = Vector2(0,0)
var pre_shot = preload("res://Scenes/Shot.tscn")
var shoTime = 0.1
var time = 0
var xp = 0
var xpNv = 10
var stateNumero = 0
var state = "res://Scenes/States/State"+str(stateNumero)+".tscn"

func _ready():
	var forma = load(state)
	$Area.add_child(forma.instance())
	pass

func _process(delta):
	move(delta)
	direction()
	if time <=0:
		if Input.is_mouse_button_pressed(1):
			time = shoTime
			for gun in  $Area.get_child(0).get_node("GunPosition").get_children():
				shot(gun.global_position)
	time -= delta
	
	upar()
	pass
	
	
	
func move(delta):
	if Input.is_action_pressed("baixo"):
		if vel.y <=200:
			vel.y += 10
	elif vel.y >=0:
		vel.y -= 1
	if Input.is_action_pressed("cima"):
		if vel.y >=-200:
			vel.y -= 10
	elif vel.y <=0:
		vel.y += 1
	if Input.is_action_pressed("direita"):
		if vel.x <=200:
			vel.x += 10
	elif vel.x >=0:
		vel.x -= 1
	if Input.is_action_pressed("esquerda"): 
		if vel.x >=-200:
			vel.x -= 10
	elif vel.x <=0:
		vel.x += 1
#	if dir.x <=1&&dir.x >0:
#		dir.x -=0.01
#	if dir.y <=1&&dir.y >0:
#		dir.y -=0.01
#	if dir.x >=-1&&dir.x <0:
#		dir.x +=0.01
#	if dir.y >=-1&&dir.y <0:
#		dir.y +=0.01
	global_position.x = global_position.x + vel.x*delta
	global_position.y = global_position.y + vel.y*delta
	

func upar():
	if xp >= xpNv:
		stateNumero+=1
		xpNv *=1.5
		xp = 0
		state = "res://Scenes/States/State"+str(stateNumero)+".tscn"
		
		var forma = load(state)
		if stateNumero <2:
			$Area.get_child(0).queue_free()
			$Area.add_child(forma.instance())
		
		
		
	
func direction():
	rotation = get_global_mouse_position().angle_to_point(position)
	pass
func shot(pos):
	var shot = pre_shot.instance()
	shot.global_position = pos
	shot.rotation = rotation+ deg2rad(90)
	shot.dir = (global_position-get_global_mouse_position()).normalized()*-1
	get_parent().add_child(shot)
	pass

