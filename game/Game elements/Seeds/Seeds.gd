extends Area2D

export(String) var seed_name=""

var areas=null
func _process(delta):
	global_position=get_global_mouse_position()


func _on_Seeds_area_entered(area):
	areas=area

func _on_Seeds_area_exited(area):
	areas=null
