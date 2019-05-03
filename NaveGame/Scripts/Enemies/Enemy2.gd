extends Area2D
var pre_shot = preload("res://Scenes/Enemies/EnimyShot.tscn")
var damage = 10
var vel = Vector2()
var life = 25*20


func _ready():
	randomize()
	vel = Vector2(randi()%300+100,randi()%300+100)
	pass

func _process(delta):
	
	global_position.x = global_position.x + vel.x*delta
	global_position.y = global_position.y + vel.y*delta
	edge()
	if is_dead():
		queue_free()
	
	pass

func edge():
	if global_position.x <0 && vel.x <0:
		vel.x *= -1
	if global_position.y <0&& vel.y <0:
		vel.y *= -1
	if global_position.x >1024 && vel.x >0:
		vel.x *= -1
	if global_position.y >600 && vel.y >0:
		vel.y *= -1
	pass

func _on_Timer_timeout():
	shot()
	pass
	
func shot():
	for gun in  get_node("GunPosition").get_children():
		var shot = pre_shot.instance()
		shot.global_position = gun.global_position
		shot.dir = (global_position-gun.global_position).normalized()*-1
		get_parent().get_node("Shots").add_child(shot)
	pass


func _on_Enimy_area_entered(area):
	if area.is_in_group("SHOTPLAYER"):
		area.queue_free()
		life -= area.damage
		get_node("AnimationPlayer").play("damage")
		pass
	pass 
	
func is_dead():
	if life <= 0:
		return true
	return false
	pass
