extends Area2D

var vel:int = 60
var vertical_direction:int = 1

func _ready() -> void:
	$Texture.play()

func _process(delta: float) -> void:
	translate(Vector2(-1,vertical_direction) * vel * delta)
	
	if position.y > 128:
		vertical_direction = -1
	elif position.y < 40:
		vertical_direction = 1
		

func _on_visible_screen_exited() -> void:
	queue_free()

func _on_area_entered(area: Area2D) -> void:
	GameControl.missiles += 1
	queue_free()
