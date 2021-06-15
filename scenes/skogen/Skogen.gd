extends Node2D
export(PackedScene) var rknapp_path
const code_solution = [1, 3, 2, 4, 1]
var current_code = []
var puzzle_solved = false
var knapp_position = Vector2(661.28, 613.513)
var rknapp
func _ready():
	$area1.connect("body_entered", self, "code_input_1")
	$area2.connect("body_entered", self, "code_input_2")
	$area3.connect("body_entered", self, "code_input_3")
	$area4.connect("body_entered", self, "code_input_4")
	rknapp = rknapp_path.instance()
	rknapp.connect("remove_rknapp", self, "remove_rknapp")
	rknapp.position = knapp_position
	
func remove_rknapp():
	remove_child(rknapp)
func code_input_1(node):
	if node.name != "mike":
		return
	code_input(1)
func code_input_2(node):
	if node.name != "mike":
		return
	code_input(2)
func code_input_3(node):
	if node.name != "mike":
		return
	code_input(3)
func code_input_4(node):
	if node.name != "mike":
		return
	code_input(4)

func code_input(num):
	if puzzle_solved:
		return
	current_code.append(num)
	$mike.position = $restart_position.position
	$mike.path = null
	global.emit_signal("mike_set_animation", "stå")
	var latest_index = current_code.size() -1
	if current_code[latest_index] != code_solution[latest_index]:
		current_code = []
		return
	elif current_code.size() == code_solution.size():
		puzzle_solved = true;
		add_child(rknapp)
