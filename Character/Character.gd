extends Area

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var active = false
var mat : Material 
onready var front = preload("res://Character/def_00.png")
onready var back = preload("res://Character/def_02.png")
# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.get_mesh().get("material").set_texture(SpatialMaterial.TEXTURE_ALBEDO, back)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Character_body_entered(body):
	if body.name == 'Player':
		$Sprite.get_mesh().get("material").set_texture(SpatialMaterial.TEXTURE_ALBEDO, front)
		active = true


func _on_Character_body_exited(body):
	if body.name == 'Player':
		$Sprite.get_mesh().get("material").set_texture(SpatialMaterial.TEXTURE_ALBEDO, back)
		active = true
