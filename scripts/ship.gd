extends Node2D

const	PRE_LASER = preload("res://scenes/laser.tscn")

var speed:int = 60

func _ready() -> void:
	pass 
	
func _process(delta: float) -> void:
	var dir_y:int = 0
	
	#Sistema de movimento da nave
	if Input.is_action_pressed("ui_up"):
		dir_y += -1
	if Input.is_action_pressed("ui_down"):
		dir_y += 1
		
	#Sistema de tiro simples
	if Input.is_action_just_pressed("shoot"):
		simple_shoot() 
	
	global_position.y = clamp(global_position.y, 13,125)
	translate(Vector2(0, dir_y) * speed * delta)
	
func simple_shoot() -> void:
	var laser_clone = PRE_LASER.instantiate()
	get_parent().add_child(laser_clone)
	laser_clone.global_position = global_position + Vector2(20,2 )
