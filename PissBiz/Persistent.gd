extends Node

const PATH = "user://settings.cfg"
var config = ConfigFile.new()

# Called when the node enters the scene tree for the first time.
func _ready():

	config.set_value("Video", "fullscreen", DisplayServer.WINDOW_MODE_WINDOWED)
	config.set_value("Video", "borderless", false)
	
	for i in range(3):
		config.set_value("Audio", str(i), 0.0)
	load_data()

func save_data():
	config.save(PATH)
	
func load_data():
	if config.load(PATH) != OK:
		save_data()
		return
	load_video_settings()
	
	
func load_video_settings():
	var screen_type = config.get_value("Video", "fullscreen")
	DisplayServer.window_set_mode(screen_type)
	
	var borderless = config.get_value("Video", "borderless")
	DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, borderless)
	

