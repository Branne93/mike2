extends StaticBody2D
export(NodePath) var mike_position_path
onready var mike_position = get_node(mike_position_path)
signal dead
func _ready():
	pass
	
func set_text(text):
	$pratbubbla.set_text(text)
func show_pratbubbla():
	$pratbubbla.show()
func hide_pratbubbla():
	$pratbubbla.hide()
	
func titta(mike):
		mike.talk_to_self("Är inte det där killen som dödade mig över bicepstyngaren i följetången?")
func putta(mike):
	mike.find_path(mike_position.global_position)
	var mouse_control = mike.get_node("mouse_control")
	mouse_control.disable_walk()
	yield(mike,"path_finished")
	$Sprite.frame = 0
	if mike.get_node("Sprite").flip_h:
		mike.get_node("Sprite").flip_h = false
	mike.set_animation("ta")
	$AnimationPlayer.play("fadeout")
	yield($AnimationPlayer, "animation_finished")
	mike.set_animation("stå")
	mouse_control.enable_walk()
	emit_signal("dead")
	#get_parent().remove_child(self)
	

	
