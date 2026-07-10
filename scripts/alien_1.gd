extends Node2D

@onready var animation:AnimatedSprite2D = $Anim
var vel:int = 80
var life:bool = true
var Possibility_powerup:int = 0

@onready var sound_dead:AudioStreamPlayer = $SoundDead

const	PRE_POWER_UP = preload("res://scenes/power_up.tscn")

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	translate(Vector2(-1,0) * vel * delta)

func _on_area_entered(_area) -> void:
	if life:
		Possibility_powerup = randi_range(1,5)
		vel = 0
		life = false
		animation.play("dead")
		sound_dead.play()
		await animation.animation_finished
		kill()
	
func spawn_powerup() -> void:
	var powerup_clone = PRE_POWER_UP.instantiate()
	get_parent().add_child(powerup_clone)
	powerup_clone.global_position = global_position
		
func kill() -> void:
	if Possibility_powerup == 2:
		spawn_powerup()
	GameControl.score += 25
	queue_free()
