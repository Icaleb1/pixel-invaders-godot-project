extends Node2D
 
@onready var  life_1:TextureRect = $Life_1
@onready var  life_2:TextureRect = $Life_2
@onready var  life_3:TextureRect = $Life_3

func _ready() -> void:
	pass 


func _process(_delta: float) -> void:
	match GameControl.lifes:
		0:
			life_1.hide()
			life_2.hide()
			life_3.hide()
		1:
			life_1.show()
			life_2.hide()
			life_3.hide()
		2:
			life_1.show()
			life_2.show()
			life_3.hide()
		3:
			life_1.show()
			life_2.show()
			life_3.show()
