extends Node2D

const PRE_ALIEN = preload("res://scenes/alien_1.tscn")

func _ready() -> void:
	start_timer()




func _on_timer_timeout() -> void:
	var alien_clone = PRE_ALIEN.instantiate()
	get_parent().add_child(alien_clone)
	alien_clone.global_position = Vector2(360,randi_range(40,120))
	start_timer()

func start_timer() -> void:
	$Timer.wait_time = randi_range(1,3)
	$Timer.start()
