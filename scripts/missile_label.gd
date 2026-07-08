extends Label	

func _process(_delta):
	text = str("%02d" % GameControl.missiles)
