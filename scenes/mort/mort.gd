extends StaticBody2D

func _ready():
	pass
func titta(mike):
		mike.talk_to_self("Ey det är ju Mort!")
		
func plocka(mike):
	mike.get_node("inventory").add_item("mort")
	$CollisionShape2D.disabled = true
	get_parent().remove_child(self)
