extends Area2D

var vel:int = 150
const	PRE_EXPLOSION = preload("res://scenes/explosion.tscn")

func _ready():
	$EfxCreated.play()
	
func _process(delta: float) -> void:
	translate(Vector2(1,0) * vel * delta)
	
func _on_area_entered(_area: Area2D) -> void:
	explosion_effect()
	vel = 0
	kill()
	
func explosion_effect() -> void:
	var explosion = PRE_EXPLOSION.instantiate()
	explosion.global_position = global_position
	get_parent().add_child(explosion)
	   
func kill() -> void:
	queue_free()


func _on_visible_screen_exited() -> void:
	kill()
