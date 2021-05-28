extends Node2D

var mouse_entered=false
var seed_name=''

var seeds=[load("res://game/Game elements/Seeds/Seeds.tscn")]
var current_seed=[]

func _ready():
	for table_seed in get_tree().get_nodes_in_group("Table_seed"):
		table_seed.connect("on_mouse_entered",self,"on_mouse_entered")
		table_seed.connect("on_mouse_entered",self,"on_mouse_exited")


func _unhandled_input(event):
	if event.is_action_pressed("Click") && mouse_entered:
		var seed_instance=seeds[0].instance()
		current_seed=[seed_instance]
		add_child(seed_instance)
	if event.is_action_released("Click"):
		if get_node(get_path_to(current_seed[0])).areas==null:
			current_seed[0].queue_free()
		elif get_node(get_path_to(current_seed[0])).areas!=null:
			var area=get_node(get_path_to(current_seed[0])).areas
			var area_parent=area.get_parent()
			area_parent.apply_conditions(seed_name)
			current_seed[0].queue_free()
		seed_name=""
func on_mouse_entered(mouse_enter,seedname):
	mouse_entered=mouse_enter
	seed_name=seedname

func on_mouse_exited(mouse_enter):
	mouse_entered=mouse_enter
