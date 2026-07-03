extends Label
	
func _ready() -> void:
	text = str("%02d" % GameControl.missiles)

func _process(_delta: float) -> void:
	pass	
