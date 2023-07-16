extends Camera2D

@onready var map_size = get_parent().map_size
var z: int = 10

func _input(ev):
	print(z)
	if Input.is_action_just_pressed("scroll_down") and z > 2:
		z-=1
	elif Input.is_action_just_pressed("scroll_up") and z < 15:
		z+=1
	elif Input.is_action_pressed("left_click"):
		if ev is InputEventMouseMotion and abs(position.y)<map_size[1]*4 and abs(position.x)<map_size[0]*4:
			position -= ev.relative / zoom
	else:
		return
	
	zoom = Vector2(z*0.01, z*0.01)
	
	if position.y > map_size[1]*4:
		position.y = -map_size[1] 
	elif -position.y > map_size[1]*4:
		position.y = map_size[1] 
	elif position.x > map_size[0]*4:
		position.x = -map_size[0] 
	elif -position.x > map_size[0]*4:
		position.x = map_size[0] 
