extends Node2D

func _ready():
	$mike/mouse_control.disable_walk()
	#$mike.remove_child($mike/mouse_control)
	global.connect("json_signal", self, "fadeaway")
	$mike/Camera2D.limit_right = $Sprite.texture.get_size().x
	$mike/Camera2D.limit_bottom = $Sprite.texture.get_size().y
	$"gymväktare/CollisionShape2D".disabled = true
	$mike/CanvasLayer/actions.hide()
	yield($Timer, "timeout")
	$"gymväktare/dialogue_player".start_dialogue()
	
func _physics_process(delta):
	$mike/mouse_control.disable_walk() #Briiljant
	

func fadeaway(string):
	if string == "exit":
		$AnimationPlayer.play("väktare_fadeout")
		yield($AnimationPlayer,"animation_finished")
		$mike.set_animation("gå")
		$AnimationPlayer.play("play_credits")
