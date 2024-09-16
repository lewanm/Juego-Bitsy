extends RichTextLabel

@onready var timer = $Timer
@onready var control = $"../.."

var template_pickup: String = "[center]Agarraste [color={item_name_color}]{item}[/color][/center]"

#Este text tendria que ser item o similar
func show_text(text:String, duration:int = 2):
	timer.start(duration)
	
	var text_variables = {
		"item": text,
		"item_name_color":control.item_name_color,
	}
	
	self.bbcode_text = template_pickup.format(text_variables)
	self.visible = true


func _on_timer_timeout():
	self.visible = false
