extends Node2D

@onready var animation:AnimatedSprite2D = $Anim
var vel:int = 80
var life:bool = true

@onready var sound_dead:AudioStreamPlayer = $SoundDead

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	translate(Vector2(-1,0) * vel * delta)

func _on_area_entered(_area) -> void:
	if life:
		vel = 0
		life = false
		animation.play("dead")
		sound_dead.play()
		await animation.animation_finished
		kill()
	
		
func kill() -> void:
	GameControl.score += 25
	queue_free()
