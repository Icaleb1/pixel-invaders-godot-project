extends VBoxContainer

var options:int = 0
var max_options:int = 3

@onready var direction: Sprite2D = $"../Direction"
var pos_seta:Array = [90, 106, 122, 138]

@onready var sound_select: AudioStreamPlayer = $"../SoundSelect"

func _ready() -> void:
	await get_tree().create_timer(2).timeout
	
	modulate.a = 0.0
	
	show()
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 1.0, 0.5)

func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("ui_down"):
		options += 1
		sound_select.play()
	if Input.is_action_just_pressed("ui_up"):
		options -= 1
		sound_select.play()
		
	if Input.is_action_just_pressed("shoot"):
		match options:
			0:
				get_tree().change_scene_to_file("res://scenes/game.tscn")
			1:
				print("configurar")
			2:
				print("creditos")
			3	:
				get_tree().quit()
			
		
	if options > max_options:
		options = 0
	if options < 0:
		options = max_options	
	direction.position.y = pos_seta[options]
