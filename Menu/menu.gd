extends Control

func _on_Play_pressed():
	get_tree().change_scene_to_file("res://Levels/LevelTest/leveltest.tscn")


func _on_Options_pressed():
	get_tree().change_scene_to_file("res://Options/options.tscn")


func _on_Quit_pressed():
	get_tree().quit()
