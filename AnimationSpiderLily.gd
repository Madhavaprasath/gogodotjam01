extends Node2D

onready var _animated_sprite = $AnimatedSprite
onready var flowerbirth = OS.get_ticks_msec()



func _process(delta):
	var age = OS.get_ticks_msec() - flowerbirth 
	if age > 13000:
		_animated_sprite.play("Babygerm")
	elif age > 20000:
		_animated_sprite.play("Infantgerm")
	elif age > 50000: 
		_animated_sprite.play("Teenagegerm")
	elif age > 100000:
		_animated_sprite.play("Youngadultgerm")
	elif age > 200000:
		_animated_sprite.play("Adultgerm")
	elif age > 400000:
		_animated_sprite.play("Oldgerm")
	else:
		_animated_sprite.stop()
	
