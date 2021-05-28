extends Node2D
class_name Calender




onready var current_data=Globals.date




func update_date():
	if current_data["month"] in [1,3,5,7,8,10,12]:
		change_time(31)
	elif current_data["month"] in [2]:
		change_time(28)
	else:
		change_time(30)
	print(current_data)


func change_time(maximum_date):
	if current_data["day"] <maximum_date:
				current_data["day"]+=1
	else:
		if current_data["month"]<12:
			current_data["month"]+=1
			current_data["day"]=1
		else:
			current_data["month"]=1
			current_data["day"]=1
			current_data["year"]+=1
		


func get_current_date():
	return current_data

