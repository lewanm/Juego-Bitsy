extends RichTextLabel

@onready var control = $"../.."

var press_button = "E" #modificar por el action input
var template_interact: String = "[center][{button}] para interactuar con [color={item_name_color}]{item}[/color][/center]"
var template_default = "[center]message_type Incorrecto, favor de revisar.[/center]"

func set_item_name(item_name: String, message_type: String):
	var text_variables = {
		"item": item_name,
		"item_name_color":control.item_name_color,
		"button":press_button
	}

	var template:String
	
	match message_type:
		"interact":
			template = template_interact
		_:
			template = template_default
	
	self.bbcode_text = template.format(text_variables)
	self.visible = true
	
