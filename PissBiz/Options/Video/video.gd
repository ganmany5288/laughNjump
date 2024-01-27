extends Control

func _ready():

	var screen_type = Persistent.config.get_value("Video", "fullscreen")
	
	if screen_type == DisplayServer.WINDOW_MODE_FULLSCREEN:
		%FullScreen.button_pressed = true
		
		
	var borderless = Persistent.config.get_value("Video", "borderless")
	
	if borderless == DisplayServer.WINDOW_MODE_FULLSCREEN:
		%FullScreen.button_pressed = true
	




func _on_full_screen_toggled(toggled_on):
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		Persistent.config.set_value("Video", "fullscreen", DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		Persistent.config.set_value("Video", "fullscreen", DisplayServer.WINDOW_MODE_WINDOWED)
	Persistent.save_data()




func _on_borderless_toggled(toggled_on):
	DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, toggled_on)


func _on_button_pressed():
	get_tree().change_scene_to_file("res://Options/options.tscn")
