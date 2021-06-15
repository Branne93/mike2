extends Node2D
export(String) var titta_text = ""
export(String, FILE, "*.json") var done_dialogue

var marsvin_funna = 0
func _ready():
	global.connect("json_signal", self, "ny_dialog")
	pass

func set_text(text):
	$pratbubbla.set_text(text)
func show_pratbubbla():
	$pratbubbla.show()
func hide_pratbubbla():
	$pratbubbla.hide()
func titta(mike):
	if titta_text != "":
		mike.talk_to_self(titta_text)
		
func used_with_item(item_name):
	if item_name == "mort" or item_name == "trassel": 
		var dialogue_player = get_node("dialogue_player")
		marsvin_funna += 1
		dialogue_player.current = dialogue_player.dialogue["marsvin" + str(marsvin_funna)]
		dialogue_player.start_dialogue()
		return true
	return false
	
func ny_dialog(string):
	if string == "monsterhummus":
		var dialogue_player = get_node("dialogue_player")
		dialogue_player.dialogue = dialogue_player.load_dialogue(done_dialogue)
