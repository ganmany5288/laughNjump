extends Control




func _on_volume_pressed():
	get_tree().change_scene_to_file("res://Options/Audio/audio.tscn")


func _on_back_pressed():
	get_tree().change_scene_to_file("res://Menu/menu.tscn")





func _on_video_pressed():
	get_tree().change_scene_to_file("res://Options/Video/video.tscn")
