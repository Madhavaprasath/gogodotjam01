extends TileMap

export (PackedScene) var plot_manager

onready var gui =get_parent()


func _ready():
	var plot_tile=get_used_cells_by_id(0)
	for tile in plot_tile:
		var plot_manager_intance=plot_manager.instance()
		plot_manager_intance.position=map_to_world(tile)+Vector2(32,32)
		add_child(plot_manager_intance)
