extends Node

var items = []

func _process(delta):
	if Input.is_key_pressed(KEY_I):
		print(items)

func add_item(item_name):
	items.append(item_name)

func remove_item(item_name):
	items.erase(item_name)

func has_item(item_name):
	return items.has(item_name)
