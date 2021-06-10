extends Node2D

const Seeds_name=["Marigold","Spider_Lily","Tobedecided"]

export (NodePath) var details_path


var mouse_entered=false
var Element_name=''

var seeds={
			"Marigold":preload("res://game/Game elements/Seeds/Mari_Gold.tscn"),
			"Spider_Lily":preload("res://game/Game elements/Seeds/Spider_Lily.tscn"),
			"Fertilizers":preload("res://game/Game elements/Seeds/Fertilizers.tscn")}
var current_seed=[]

onready var details=get_node(details_path)

func _ready():
	for table_seed in get_tree().get_nodes_in_group("Table_seed"):
		table_seed.connect("entered",self,"on_mouse_entered")
		table_seed.connect("exited",self,"on_mouse_exited")


func _unhandled_input(event):
	if event.is_action_pressed("Click") && mouse_entered:
		var seed_instance=seeds[Element_name].instance()
		current_seed=[seed_instance]
		add_child(seed_instance)
		if Element_name in Seeds_name: 
			details.on_display(Element_name)
	if event.is_action_released("Click") && get_node(get_path_to(current_seed[0]))!=null:
		if get_node(get_path_to(current_seed[0])).areas==null:
			current_seed[0].queue_free()
		elif get_node(get_path_to(current_seed[0])).areas!=null:
			var area=get_node(get_path_to(current_seed[0])).areas
			var area_parent=area.get_parent()
			if Element_name in Seeds_name:
				area_parent.apply_conditions(Element_name)
				details.on_display(Element_name)
			elif Element_name in ["Fertilizers"]:
				area_parent.start_fertilization()
			elif Element_name in ["Remove"]:
				area_parent.remove_the_plot()
			current_seed[0].queue_free()
		#put element name



func on_mouse_entered(mouse_enter,seedname):
	mouse_entered=mouse_enter
	Element_name=seedname

func on_mouse_exited(mouse_enter):
	mouse_entered=mouse_enter
