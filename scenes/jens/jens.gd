extends Node2D
var done = false

func _ready():
	$AnimationPlayer.play("knytaskor")
	global.connect("json_signal", self, "flyg_hem")
	
func set_text(text):
	$pratbubbla.set_text(text)
func show_pratbubbla():
	$pratbubbla.show()
	$AnimationPlayer.play("stå")
func hide_pratbubbla():
	$pratbubbla.hide()
	if done:
		return
	$AnimationPlayer.play("knytaskor")
	
func titta(mike):
		mike.talk_to_self("Ey det är Jens! Men vad gör han?")
		
func used_with_item(item_name):
	if item_name == "rknapp": 
		done = true;
		var dialogue_player = get_node("dialogue_player")
		dialogue_player.current = dialogue_player.dialogue["ge_rknapp"]
		dialogue_player.start_dialogue()
		return true
	return false
	
func flyg_hem(string):
	if string == "get_skor":
		$AnimationPlayer.play("flyg2")
		yield($AnimationPlayer, "animation_finished")
		get_parent().remove_child(self)
