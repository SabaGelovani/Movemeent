extends TextureButton
class_name SkillNode

@onready var panel = $Panel
@onready var label = $MarginContainer/Label

var level : int = 0  # Removed setget and setter

var skills = []

func _ready():
	# Get all child nodes and store them in the skills array
	skills = get_children()  # Get all child nodes
	
	# Optional: Print the names of all child nodes to verify
	for skill in skills:
		print(skill.name)

func _on_pressed() -> void:
	level = min(level + 1, 3)  # Increases the level but doesn't exceed 3
	label.text = str(level) + "/3"  # Updates the label to reflect the new level
	panel.show_behind_parent = true
	
	for skill in skills:
		if skill is SkillNode:
			skill.disabled = false  # Enable the skill
