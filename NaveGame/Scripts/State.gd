extends Area2D

var life = 25

func _ready():
	life += get_parent().get_parent().lifeMax + get_parent().get_parent().lifeMax/2
	get_parent().get_parent().lifeMax = life
	Globals.playerLifeMax = life
	print(Globals.playerLifeMax)
	pass

func _process(delta):
	Globals.playerLife = life
	
	if is_dead():
		
		get_parent().get_parent().queue_free()
	pass



func _on_State_area_entered(area):
	if area.is_in_group("ENIMY"):
		life -= area.damage
		print(life)
		pass
	pass

func is_dead():
	if life <= 0:
		return true
	return false
	pass
	
	
	