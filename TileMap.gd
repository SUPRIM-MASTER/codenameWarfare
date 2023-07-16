extends TileMap

var width = 64
var height = 64
@onready var map_size = get_parent().map_size
@onready var camera = get_parent().get_node("Camera2D")

func _ready():
	generate_map(camera.position)
	print(camera.position)
	
func generate_map(position):
	var tile_pos = local_to_map(position)
	for x in range(map_size[0]):
		for y in range(map_size[1]):
			set_cell(0, Vector2i(tile_pos.x-map_size[0]/2 + x, tile_pos.y-map_size[1]/2 + y), 0, Vector2i(2, 0))
	for x in range(width):
		for y in range(height):
			set_cell(0, Vector2i(tile_pos.x-width/2 + x, tile_pos.y-height/2 + y), 0, Vector2i(0, 0))
