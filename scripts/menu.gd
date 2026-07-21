extends VBoxContainer

var options:int = 0
var max_options:int = 3

@onready var direction: Sprite2D = $"../Direction"
var pos_seta:Array = [90, 106, 122, 138]

@onready var sound_select: AudioStreamPlayer = $"../SoundSelect"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("ui_down"):
		options += 1
		sound_select.play()
	if Input.is_action_just_pressed("ui_up"):
		options -= 1
		sound_select.play()
	if options > max_options:
		options = 0
	if options < 0:
		options = max_options
	direction.position.y = pos_seta[options]
