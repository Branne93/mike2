extends Node

export(NodePath) var root_nodepath

export(PackedScene) var main_menu_path
export(PackedScene) var johanneberg_path
export(PackedScene) var skogen_path
export(PackedScene) var gymmet_path
export(PackedScene) var end_path

var scene_dict = {}
var current_scene = null
onready var root_node = get_node(root_nodepath)

const main_menu = "main_menu"
const johanneberg = "johanneberg"
const skogen = "skogen"
const gymmet = "gymmet"
const end = "end"

func _ready():
	scene_dict[main_menu] = main_menu_path.instance()
	scene_dict[johanneberg] = johanneberg_path.instance()
	scene_dict[skogen] = skogen_path.instance()
	scene_dict[gymmet] = gymmet_path.instance()
	scene_dict[end] = end_path.instance()
	global.connect("exit", self, "set_scene")
	global.connect("json_signal", self, "end")

func set_scene(key, mike=null):
	if not scene_dict.has(key):
		print("ERROR: key not in dict")
		return
	if current_scene != null:
		yield(root_node.fade_in(), "completed")
		root_node.remove_child(current_scene)
	root_node.add_child(scene_dict[key])
	if current_scene != null:
		root_node.fade_out()
	current_scene = scene_dict[key]
	if mike:
		current_scene.get_node("mike").set_inventory(mike)
		
func end(string):
	if string=="end":
		set_scene(end)
