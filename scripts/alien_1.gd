extends Node2D

@onready var animation:AnimatedSprite2D = $Anim
var vel:int = 60



func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	translate(Vector2(-1,0) * vel * delta)


func _on_area_entered(_area) -> void:
	vel = 0
	animation.play("dead")
	await animation.animation_finished
	kill()
		
func kill() -> void:
	queue_free()
