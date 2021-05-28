extends Area2D

signal on_mouse_entered(mouse_entered,seed_name)
signal on_mouse_exited(mouse_entered)

export(String) var seed_name

onready var table=get_parent().get_parent()
var mouse_entered=false



func _on_Table_seed_mouse_entered():
	if !mouse_entered:
		mouse_entered=true
		emit_signal("on_mouse_entered",mouse_entered,seed_name)


func _on_Table_seed_mouse_exited():
	mouse_entered=false
	emit_signal("on_mouse_exited",mouse_entered)
