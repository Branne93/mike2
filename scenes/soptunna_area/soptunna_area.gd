extends StaticBody2D
export(String) var titta_text = "Massa sopor här. Ligger en gammal öl i också."
func _ready():
	pass

func titta(mike):
	if titta_text != "":
		mike.talk_to_self(titta_text)
		
func plocka(mike):
	mike.get_node("inventory").add_item("gammal_ol")
	$CollisionShape2D.disabled = true
