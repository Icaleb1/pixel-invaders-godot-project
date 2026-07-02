extends Node2D

var speed:int = 60

func _ready() -> void:
	pass 


func _process(delta: float) -> void:
	var dir_y:int = 0
	var dir_x:int = 0
	
	if Input.is_action_pressed("ui_up"):
		dir_y += -1
	if Input.is_action_pressed("ui_down"):
		dir_y += 1
		
	if Input.is_action_pressed("ui_left"):
		dir_x += -1
		
	if Input.is_action_pressed("ui_right"):
		dir_x += 1
		
	global_position.y = clamp(global_position.y, 13,125)
	
	#Maneira manual de limitar o global position
	#if global_position.y < 13:
		#global_position.y = 13
	#
	#if global_position.y > 125:
		#global_position.y = 125
		
	translate(Vector2(dir_x, dir_y) * speed * delta)
