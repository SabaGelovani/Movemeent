extends Control

@onready var play_button = $Button  # Reference to the play button
@onready var note2d_scene = preload("res://Node2D.tscn")  # Preload the Note2D scene

var note2d_instance: Node2D  # Variable to hold the instance of the mini-game scene

func _ready():
	# Initially hide the mini-game (Note2D) when the scene starts
	# Don't set the note2d instance visible just yet
	note2d_instance = null  # Ensure that there's no previous instance hanging around

	# Connect the play button's "pressed" signal to the function "_on_play_button_pressed"
	
func _on_play_button_pressed():
	# Hide the main menu (this will also hide the play button and bridge image)
	self.visible = false

	# Instance the Note2D scene when the play button is pressed
	if note2d_instance == null:
		note2d_instance = note2d_scene.instantiate()  # Create a new instance of the Note2D scene
		
		# Add it as a child of the current scene (MainMenu)
		add_child(note2d_instance)
		
		# Now, show the mini-game
		note2d_instance.visible = true
