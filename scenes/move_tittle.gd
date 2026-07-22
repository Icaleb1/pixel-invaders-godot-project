extends Node2D

@export var pos_final:Vector2

func _ready() -> void:
	opening()

func opening() -> void:
	var new_tween = get_tree().create_tween()
	new_tween.tween_property(self, "position", Vector2(pos_final), 2).set_trans(Tween.TRANS_ELASTIC)
