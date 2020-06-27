extends Button

export(String) var scene_to_load

onready var sfxButton = $SFXButton

func _on_MenuButton_mouse_entered():
	sfxButton.play()
