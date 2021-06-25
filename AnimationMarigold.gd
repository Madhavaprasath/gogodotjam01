extends Node2D

onready var _animated_sprite = $AnimatedSprite
onready var flowerbirth = OS.get_ticks_msec()



func _process(delta):
	var age = OS.get_ticks_msec() - flowerbirth 
	if age > 13000:
		_animated_sprite.play("Babygerm")
	elif age > 26000:
		_animated_sprite.play("Infantgerm")
	elif age > 52000: 
		_animated_sprite.play("Teenagegerm")
	elif age > 104000:
		_animated_sprite.play("Youngadultgerm")
	elif age > 208000:
		_animated_sprite.play("Adultgerm")
	elif age > 416000:
		_animated_sprite.play("Oldgerm")
	else:
		_animated_sprite.stop()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
