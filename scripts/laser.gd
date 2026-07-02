extends Area2D

var vel:int = 150

func _ready() -> void:
	pass 
	
func _process(delta: float) -> void:
	translate(Vector2(1,0) * vel * delta)
	
	if global_position.x > 300:
		queue_free()
