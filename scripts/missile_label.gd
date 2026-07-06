extends Label
	
func _ready() -> void:
	text = str("%02d" % GameControl.missiles)
