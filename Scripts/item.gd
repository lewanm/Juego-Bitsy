extends Area2D

var item_data: Dictionary
@export var item_name:String
@export var type:String
@export var _imagen = 1 # agregar en el ready para que modifique su imagen

func _ready():
	item_data = {
		'name':item_name,
		'type':type
	}

func get_item_data():
	return item_name

func pickup():
	queue_free()
