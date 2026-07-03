extends Label

func _ready() -> void:
	text = str("%04d" % GameControl.score) 

func _process(_delta: float) -> void:
	text = str("%04d" % GameControl.score)	
