extends Node


var states={1:"Initialized",
			2:"Growing",
			3:"Seed_droping",
			4:"Stable",
			5:"Late_stable",
			6:"Emptied"
}

var plant_name:String=""
var current_state
var previous_state

onready var plot_manager=get_parent()




func _physics_process(delta):
	if plot_manager.intialized && current_state!=null:
		state_logic(delta)
		var state=transition(delta)
		if state!=null:
			previous_state=current_state
			current_state=state
			print(current_state)
			enter_state(current_state,previous_state)
			exit_state(previous_state,current_state)




func state_logic(delta):
	if current_state in ["Emptied"]:
		plot_manager.at_end()
		finish_plantation()
func transition(delta):
	match current_state:
		"Initialized":
			if compare_days(plot_manager.current_date_month,plot_manager.expected_time[0]):
				return states[2]
		"Growing":
			if compare_days(plot_manager.current_date_month,plot_manager.expected_time[1]):
				return states[3]
		"Seed_droping":
			if compare_days(plot_manager.current_date_month,plot_manager.expected_time[2]):
				return states[4]
		"Stable":
			if compare_days(plot_manager.current_date_month,plot_manager.expected_time[3]):
				return states[5]
		"Late_stable":
			if compare_days(plot_manager.current_date_month,plot_manager.expected_time[3]):
				return states[6]
		"Emptied":
			pass
	return null

func start_plantation():
	current_state=states[1]

func finish_plantation():
	current_state=null



func compare_days(dict1,dict2):
	#compare date
	if dict1["day"]>=dict2["day"]&&dict1["month"]==dict2["month"]:
		return true
	else:
		return false




func enter_state(new_state,old_state):
	pass

func exit_state(old_state,new_state):
	pass
	
