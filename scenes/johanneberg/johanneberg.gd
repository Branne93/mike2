extends Node2D

func _ready():
	$dialogue_player.start_dialogue()
	$mike/Camera2D.limit_right = $Sprite.texture.get_size().x
