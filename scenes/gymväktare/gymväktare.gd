extends StaticBody2D

func _ready():
	global.connect("json_signal", self, "check_win")
	pass
func titta(mike):
		mike.talk_to_self("Det är gymväktaren, han ser till att endast värdiga själar kommer in.")
func set_text(text):
	$pratbubbla.set_text(text)
func show_pratbubbla():
	$pratbubbla.show()
func hide_pratbubbla():
	$pratbubbla.hide()

func check_win(string):
	if string == "check_win" and global.deo and global.klader and global.skor:
		var dialogue_player = get_node("dialogue_player")
		dialogue_player.current['next'] = "win"
