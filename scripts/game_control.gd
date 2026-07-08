extends Node

var lifes:int = 3
var missiles:int = 3
var score:int = 0

func _process(delta: float) -> void:
	if missiles > 5:
		missiles = 5
