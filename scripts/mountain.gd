extends ParallaxBackground

@export var vel_scrolling:int = 30

func _process(delta: float) -> void:
	scroll_offset.x -= vel_scrolling * delta
