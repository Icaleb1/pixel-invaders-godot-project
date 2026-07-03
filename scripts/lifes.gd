extends Node2D
 
@onready var  live_1:TextureRect = $Live_1
@onready var  live_2:TextureRect = $Live_2
@onready var  live_3:TextureRect = $Live_3

func _ready() -> void:
	pass 


func _process(delta: float) -> void:
	match GameControl.lifes:
		0:
			live_1.hide()
			live_2.hide()
			live_3.hide()
		1:
			live_1.show()
			live_2.hide()
			live_3.hide()
		2:
			live_1.show()
			live_2.show()
			live_3.hide()
		3:
			live_1.show()
			live_2.show()
			live_3.show()
