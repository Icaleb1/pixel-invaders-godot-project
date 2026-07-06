extends Node2D

const	PRE_LASER = preload("res://scenes/laser.tscn")
const	PRE_MISSILE = preload("res://scenes/missile.tscn")

var speed:int = 60
var invencible:bool = false


@onready var sound_shoot:AudioStreamPlayer = $ShootSound
@onready var invencible_time:Timer = $InvencibleTime
@onready var animation: AnimationPlayer = $Animation

func _ready() -> void:
	invencible_state()
	
func _process(delta: float) -> void:
	if invencible == true:
		animation.play("shield")
	else: 
		animation.play("idle")
	
	var dir_y:int = 0
	
	#Sistema de movimento da nave
	if Input.is_action_pressed("ui_up"):
		dir_y += -1
	if Input.is_action_pressed("ui_down"):
		dir_y += 1
		
	#Sistema de tiro simples
	if Input.is_action_just_pressed("shoot"):
		sound_shoot.play()
		simple_shoot() 
		
	if Input.is_action_just_pressed("Attack"):
		special_shoot()
	
	global_position.y = clamp(global_position.y, 38,120)
	translate(Vector2(0, dir_y) * speed * delta)
	
func simple_shoot() -> void:
	var laser_clone = PRE_LASER.instantiate()
	get_parent().add_child(laser_clone)
	laser_clone.global_position = global_position + Vector2(20, 2)
	
func special_shoot() -> void:
	var missile_clone = PRE_MISSILE.instantiate()
	get_parent().add_child(missile_clone)
	missile_clone.global_position = global_position + Vector2(20, 2)

func damage(_value:int) -> void:
	pass

func _on_body_area_entered(_area) -> void:
	if invencible == false:
		GameControl.lifes -= 1
		invencible_state()
	
func _on_invencible_time_timeout() -> void:
	invencible = false
	
func invencible_state() -> void:
	invencible = true 
	invencible_time.start()
