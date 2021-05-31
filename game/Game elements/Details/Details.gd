extends Node2D

onready var display_details=ImportData.crop_details

onready var Seed_texture=get_node("Control/VBoxContainer/HBoxContainer/TextureRect")
onready var Seed_name=get_node("Control/VBoxContainer/HBoxContainer/Seed_name")
onready var Seeding_label=get_node("Control/VBoxContainer/HBoxContainer2/Seeding_label")
onready var Seed_drop=get_node("Control/VBoxContainer/HBoxContainer2/Seed_drop")
onready var Stable_days=get_node("Control/VBoxContainer/HBoxContainer3/Stable_days")
onready var Late_stable=get_node("Control/VBoxContainer/HBoxContainer3/Late_stable")
func _ready():
	finish_display()

func on_display(Seedname):
	print("displaying")
	Seed_name.set_text("Name:"+str(Seedname))
	Seeding_label.set_text("Days taken for seeding:"+str(display_details[Seedname]["Days_grow"])+"Days")
	Seed_drop.set_text("Days to Drops Seeds:"+str(display_details[Seedname]["Seed_drop"])+"Days")
	Stable_days.set_text("Days to be stable:"+str(display_details[Seedname]["Stable_days"])+"Days")
	Late_stable.set_text("Days to be Late_stable:"+str(display_details[Seedname]["Late_days"])+"Days")

func finish_display():
	Seed_name.set_text("")
	Seeding_label.set_text("")
	Seed_drop.set_text("")
	Stable_days.set_text("")
	Late_stable.set_text("")
