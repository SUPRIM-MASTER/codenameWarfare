extends Camera2D

@onready var map_size = get_parent().map_size
var z: int = 10

func _input(ev):
	print(z)
	if Input.is_action_just_pressed("scroll_down") and z > 2:
		z-=1
	elif Input.is_action_just_pressed("scroll_up") and z < 15:
		z+=1
	elif ev is InputEventMouseMotion:
		if Input.is_action_pressed("left_click"):
			position -= ev.relative / zoom
	else:
		return
	
	zoom = Vector2(z*0.01, z*0.01)
	
	if position.y >= map_size[1]*4:
		position.y = -position.y +100
	elif -position.y >= map_size[1]*4:
		position.y = -position.y -100
	elif position.x >= map_size[0]*4:
		position.x = -position.x +100
	elif -position.x >= map_size[0]*4:
		position.x = -position.x -100
