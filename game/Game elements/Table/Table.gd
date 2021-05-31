extends Node2D

export (NodePath) var details_path


var mouse_entered=false
var Element_name=''

var seeds=[load("res://game/Game elements/Seeds/Seeds.tscn")]
var current_seed=[]

onready var details=get_node(details_path)

func _ready():
	for table_seed in get_tree().get_nodes_in_group("Table_seed"):
		table_seed.connect("entered",self,"on_mouse_entered")
		table_seed.connect("exited",self,"on_mouse_exited")


func _unhandled_input(event):
	if event.is_action_pressed("Click") && mouse_entered:
		var seed_instance=seeds[0].instance()
		current_seed=[seed_instance]
		add_child(seed_instance)
		if Element_name in ["Wheat"]: 
			details.on_display(Element_name)
	if event.is_action_released("Click"):
		if get_node(get_path_to(current_seed[0])).areas==null:
			current_seed[0].queue_free()
		elif get_node(get_path_to(current_seed[0])).areas!=null:
			var area=get_node(get_path_to(current_seed[0])).areas
			var area_parent=area.get_parent()
			if Element_name in ["Wheat"]:
				area_parent.apply_conditions(Element_name)
				details.on_display(Element_name)
			elif Element_name in ["Fertilizers"]:
				area_parent.start_fertilization()
			elif Element_name in ["Remove"]:
				area_parent.remove_the_plot()
			current_seed[0].queue_free()
		Element_name=""
		details.finish_display()



func on_mouse_entered(mouse_enter,seedname):
	mouse_entered=mouse_enter
	Element_name=seedname

func on_mouse_exited(mouse_enter):
	mouse_entered=mouse_enter
