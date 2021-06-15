extends Node2D
signal remove_rknapp

func _ready():
	pass

func titta(mike):
		mike.talk_to_self("Låg det en r-knapp gömd i skogen vid mossen?")
		
func plocka(mike):
	mike.get_node("inventory").add_item("rknapp")
	$CollisionShape2D.disabled = true
	emit_signal("remove_rknapp")
