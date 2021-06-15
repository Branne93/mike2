extends Node2D
const area_width = 4752 
const area_heigth = 3384

func _ready():
	$mike/Camera2D.limit_bottom = area_heigth
	$mike/Camera2D.limit_right = area_width
	$gymdude.connect("dead", self, "remove_gymdude")
	$mike.get_inventory().add_item("rknapp")

func remove_gymdude():
	remove_child($gymdude)
	$mike.pathfinder = $Navigation2D2
	remove_child($Navigation2D)
	$mike.talk_to_self("Sprillans nya gymkläder! Hurra!")
	global.emit_signal("get_klader")
	global.klader = true
