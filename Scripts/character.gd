extends CharacterBody2D

@export var speed: int = 200
@export var object_near_player = null

@onready var ui_node = get_node("/root/Game/Canvas/UI")

#otra opcion seria si quiero hacerlo movimiento tipo en celdas, seria usar _input que te devuelve cuando se presiona algo y no busca frame a frame
func _process(_delta):
	move_player()
	intect_with_near_object()
	

func move_player():
	var input_direction = Vector2.ZERO
	
	if Input.is_action_pressed("move_right"):
		input_direction.x = 1
	if Input.is_action_pressed("move_left"):
		input_direction.x = -1
	if Input.is_action_pressed("move_up"):
		input_direction.y = -1
	if Input.is_action_pressed("move_down"):
		input_direction.y = 1
		
	input_direction = input_direction.normalized()
	velocity = input_direction * speed #* _delta * 60
	
	move_and_slide()

func intect_with_near_object():
	if object_near_player!= null and Input.is_action_just_pressed("action"):
		object_near_player.action()

func _on_item_detector_body_entered(body):
	object_near_player = body
	body.automatic_action()
	#en vez de door_name tendria que ser algo mas generico, pero no se me ocurre porque solo estoy usando puertas por ahora
	ui_node.show_action_text(body.door_name, "interact")

func _on_item_detector_body_exited(_body):
	object_near_player = null
	ui_node.hide_action_text()

func _on_item_detector_item_entered(item):
	if item.is_in_group("item"):
		print("Debug: ", item.get_item_data())
		INVENTORY.add_item(item.get_item_data())
		ui_node.show_complementary_text(item.get_item_data())
		item.pickup()

	
