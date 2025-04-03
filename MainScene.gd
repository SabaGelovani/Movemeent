extends Control

# Preload the Game Scene (replace with your actual Game Scene path)
@onready var game_scene = preload("res://node_2d.tscn")  # Adjust the path

func _ready():
	$Button.connect("pressed", self, "_on_PlayButton_pressed")

func _on_PlayButton_pressed():
	# Instantiate the game scene when the button is pressed
	var game_instance = game_scene.instance()

	# Add the game scene to the current scene (as a "popup")
	get_tree().current_scene.add_child(game_instance)

	# Optional: You can set the size and position of the game popup
	game_instance.rect_min_size = Vector2(600, 400)  # Set your desired size
	game_instance.position = Vector2(100, 100)  # Position it where you want

	# Show the game scene as a popup
	game_instance.show()

	# Optionally, you can hide the button after it's clicked
	$Button.hide()
