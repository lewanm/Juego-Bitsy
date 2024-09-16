extends Control

@onready var acction_label = $LabelContainer/AcctionLabel
@onready var complementary_label = $LabelContainer/ComplementaryLabel

@export var item_name_color:String = "green"

func show_action_text(item_name:String, message_type: String = "interact") -> void:
	acction_label.set_item_name(item_name, message_type)

func hide_action_text() -> void:
	acction_label.visible = false

func show_complementary_text(text):
	complementary_label.show_text(text)
