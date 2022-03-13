extends Area

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var active = false
onready var mat : Material = $Sprite.get_mesh().get("material")
export var front = preload("res://Character/def_00.png")
export var back = preload("res://Character/def_02.png")
export var area_radius = 3.18
# Called when the node enters the scene tree for the first time.
func _ready():
	mat.set_texture(SpatialMaterial.TEXTURE_ALBEDO, back)
	$CollisionShape.get_shape().radius = area_radius
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _input(event):
	if get_node_or_null("DialogNode") == null:
		if event.is_action_pressed("ui_accept") and active:
			get_tree().paused = true
			var dialog = Dialogic.start('test')
			dialog.pause_mode = Node.PAUSE_MODE_PROCESS
			dialog.connect('timeline_end', self, 'unpause')
			add_child(dialog)

# warning-ignore:unused_argument
func unpause(timeline_name):
	get_tree().paused = false


func _on_Character_body_entered(body):
	if body.name == 'Player':
		mat.set_texture(SpatialMaterial.TEXTURE_ALBEDO, front)
		active = true


func _on_Character_body_exited(body):
	if body.name == 'Player':
		mat.set_texture(SpatialMaterial.TEXTURE_ALBEDO, back)
		active = false
