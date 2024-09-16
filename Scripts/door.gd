extends StaticBody2D

@export var is_locked : bool = false
@export var necesary_item: String
@export var next_room8ui : Vector2
@export var door_dialog: String = "La puerta esta cerrada con llave"
@export var door_name:String

#ver que nombres les pongo
func automatic_action() -> void:
	if !is_locked:
		print("Mover al jugador a la siguiente sala")
		#reemplazar esto con mover al jugador
	else:
		print(door_dialog)

func action() -> void:
	if is_locked and INVENTORY.has_item(necesary_item): #despues ver que lo tenga en su inventario
		unlock_door()
		print("Se abrio la puerta")
		
	automatic_action()

func unlock_door() -> void:
	is_locked = false
