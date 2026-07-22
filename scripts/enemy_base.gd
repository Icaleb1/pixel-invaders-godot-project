extends Node2D

@onready var animation:AnimationPlayer = $Anim
@onready var sound_dead:AudioStreamPlayer = $Sound

var vel:int = 50
var life:bool = true
var Possibility_powerup:int = 0

const	PRE_POWER_UP = preload("res://scenes/power_up.tscn")

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	translate(Vector2(-1,0) * vel * delta)


func _on_hit_box_area_entered(area: Area2D) -> void:
	if life:
		Possibility_powerup = randi_range(1,5)
		vel = 0
		life = false
		animation.play("dead")
		sound_dead.play()
		await animation.animation_finished
		kill()

func kill() -> void:
	if Possibility_powerup == 2:
		spawn_powerup()
	GameControl.score += 25
	queue_free()
	
func spawn_powerup() -> void:
	var powerup_clone = PRE_POWER_UP.instantiate()
	get_parent().add_child(powerup_clone)
	powerup_clone.global_position = global_position
