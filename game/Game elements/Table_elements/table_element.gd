extends Area2D

signal entered(mouse_entered,Element_name)
signal exited(mouse_entered)

export(String) var Element_name

onready var table=get_parent().get_parent()
onready var tween=get_node("Tween")


var mouse_entered=false

func show_amount(amount):
	pass


func _on_Table_seed_mouse_entered():
	if !mouse_entered:
		mouse_entered=true
		emit_signal("entered",mouse_entered,Element_name)
func _on_Table_seed_mouse_exited():
	mouse_entered=false
	emit_signal("exited",mouse_entered)
