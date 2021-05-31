extends Node2D



onready var plant_area=get_node("Plant_area")
onready var animation_player=get_node("AnimationPlayer")
onready var crop_details=ImportData.crop_details
onready var Plant=get_node("Plant_state")

var current_date_month=Globals.date
var planted_time
var planted_seed=""
var conditions=[]
var intialized=false
var expected_time=[]
var condition_dict
var is_fertilized=false

var drop_seeds={}

func _ready():
	pass



func apply_conditions(seed_name)->void:
	print("applied")
	planted_seed=seed_name
	intialized=true
	condition_dict={
		"Initalized":1,
		"Growing":crop_details[planted_seed]["Days_grow"],
		"Seed_droping":crop_details[planted_seed]["Seed_drop"],
		"Stable":crop_details[planted_seed]["Stable_days"],
		"Late_stable":crop_details[planted_seed]["Late_days"]
	}
	planted_time=current_date_month
	conditions=[1,condition_dict["Growing"],condition_dict["Seed_droping"],condition_dict["Stable"],condition_dict["Late_stable"]]
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

func start_fertilization():
	on_fetilization(Plant.current_state)



func on_fetilization(state):
	if !is_fertilized && intialized:
		if state!="Initialized" or state!="Emptied":
			is_fertilized=true
		match state:
			"Growing":
				expected_time[1]["day"]-=1
			"Seed_droping":
				expected_time[2]["day"]-=1
			"Stable":
				expected_time[3]["day"]-=1
			"Late_stable":
				expected_time[4]["day"]-=1

func remove_the_plot():
	print("removed")
	Plant.current_state="Emptied"


func at_end():
	planted_seed=""
	planted_time={}
	conditions=[]
	expected_time=[]
	condition_dict={}
	is_fertilized=false

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
