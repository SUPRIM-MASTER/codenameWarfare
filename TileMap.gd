extends TileMap


# Called when the node enters the scene tree for the first time.
const TOPL = 0
const TOPR = 2

var binds = {
	TOPL : [TOPR],
	TOPR : [TOPL]
}

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _is_title_bound(draw_id, neighbor_id):
	if draw_id in binds:
		return neighbor_id in binds[draw_id]
	return false
