extends Node2D

@onready var animation:AnimatedSprite2D = $Anim
var vel:int = 60

@onready var sound_dead:AudioStreamPlayer = $SoundDead

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	translate(Vector2(-1,0) * vel * delta)

func _on_area_entered(_area) -> void:
	vel = 0
	animation.play("dead")
	sound_dead.play()
	await animation.animation_finished	
	kill()
	
		
func kill() -> void:
	GameControl.score += 25
	queue_free()
