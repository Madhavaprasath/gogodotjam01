extends Node

var crop_details

func _ready():
	crop_details=read_cropdetails()

func read_cropdetails():
	var file=File.new()
	file.open("res://Jsons/Crop_details.json",File.READ)
	var text=file.get_as_text()
	var json_result=JSON.parse(text).result
	return json_result["Crop_details"]
