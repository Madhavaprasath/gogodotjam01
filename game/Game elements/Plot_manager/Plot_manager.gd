extends Node2D


var planting_seed=""
var planted_seed=""

onready var plant_area=get_node("Plant_area")
onready var animation_player=get_node("AnimationPlayer")
onready var crop_details=ImportData.crop_details
onready var Plant=get_node("Plant_state")

var current_date_month=Globals.date
var planted_time
var conditions=[]
var intialized=false
var expected_time=[]

func _ready():
	pass

func _unhandled_input(event):
	if event.is_action_released("Click") && planting_seed!="":
		planted_seed=planting_seed
		planting_seed=""


func apply_conditions(seed_name)->void:
	print("applied")
	planted_seed=seed_name
	intialized=true
	var days_taken=crop_details["Wheat"]["Days_grow"]
	var seeding=crop_details["Wheat"]["Seed_drop"]
	var stable_days=crop_details["Wheat"]["Stable_days"]
	var Late_days=crop_details["Wheat"]["Late_days"]
	planted_time=current_date_month
	conditions=[1,days_taken,seeding,stable_days,Late_days]
	calculating_Days_taken(planted_time)
	Plant.start_plantation()

func calculating_Days_taken(data):
	
	var last_date
	var sum=0
	if data["month"] in [1,3,5,7,8,10,12]:
		last_date=31
	elif data["month"] in [2]:
		last_date=28
	else:
		last_date=30
	
	for i in range(0,len(conditions)):
		sum+=conditions[i]
		expected_time.append(return_expected_date(data,last_date,sum))

func at_end():
	planted_seed=""
	planted_time={}
	conditions=[]
	expected_time=[]
func return_expected_date(data,last_date,sum):
	var target=data.duplicate()
	var expected_date=target["day"]+sum
	if expected_date>last_date:
		target["day"]=expected_date-last_date
		if target["month"]<12:
			target["month"]+=1
		else:
			target["month"]=1
			target["year"]+=1
	else:
		target["day"]=expected_date
	return target
