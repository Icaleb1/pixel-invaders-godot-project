extends Node2D

var vel:int = 60

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	translate(Vector2(-1,0) * vel * delta)


func _on_area_entered(area) -> void:
	queue_free()
