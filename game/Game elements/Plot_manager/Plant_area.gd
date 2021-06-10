extends Area2D


var tile

signal change_tile(tile_position,factor)


func _on_Plant_area_body_entered(body):
	tile=body
