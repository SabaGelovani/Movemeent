extends Node2D

# Define movement speed
var speed = 500  # Speed in pixels per second
var moving = false  # Flag to indicate if the sprite is moving
var target_position = Vector2.ZERO  # The target position to move towards

# Reference to the moving sprite
@onready var moving_sprite = $Character  # Main sprite node
@onready var target_sprite_1 = $PointA  # First clickable target sprite
@onready var target_sprite_2 = $PointB  # Second clickable target sprite
@onready var target_sprite_3 = $PointC  # Third clickable target sprite
@onready var target_sprite_4 = $PointD
@onready var target_sprite_5 = $PointE
@onready var target_sprite_6 = $PointF

# Called when the node is ready.
func _ready():
	# Initially set the sprite's position to one of the target positions (PointA)
	moving_sprite.position = target_sprite_1.position
	target_position = moving_sprite.position
	moving = false  # Start stationary

	# Set the moving sprite on top of the target sprites by setting a higher Z-index
	moving_sprite.z_index = 1
	target_sprite_1.z_index = 0
	target_sprite_2.z_index = 0
	target_sprite_3.z_index = 0
	target_sprite_4.z_index = 0
	target_sprite_5.z_index = 0
	target_sprite_6.z_index = 0

# Called every frame.
func _process(delta):
	if moving:
		# Move the sprite towards the target position smoothly
		var direction = (target_position - moving_sprite.position).normalized()
		var movement = direction * speed * delta

		# Stop moving if the sprite is close enough to the target position
		if moving_sprite.position.distance_to(target_position) < 1:
			moving_sprite.position = target_position
			moving = false  # Stop moving
		else:
			moving_sprite.position += movement

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		print("Mouse clicked at:", event.position)  # Debugging info
		
	if event is InputEventMouseButton and event.pressed:
		print("Mouse clicked at:", event.position)  # Debugging info

		# Check if the mouse click is on any of the target points
		if is_click_on_sprite(event.position, target_sprite_1):
			print("Clicked on PointA")
			target_position = target_sprite_1.position
			moving = true
			$CoinManager.handle_coin_change()  # Randomly add or subtract coins
		elif is_click_on_sprite(event.position, target_sprite_2):
			print("Clicked on PointB")
			target_position = target_sprite_2.position
			moving = true
			$CoinManager.handle_coin_change()  # Randomly add or subtract coins
		elif is_click_on_sprite(event.position, target_sprite_3):
			print("Clicked on PointC")
			target_position = target_sprite_3.position
			moving = true
			$CoinManager.handle_coin_change()  # Randomly add or subtract coins
		elif is_click_on_sprite(event.position, target_sprite_4):
			print("Clicked on PointD")
			target_position = target_sprite_4.position
			moving = true
			$CoinManager.handle_coin_change()  # Randomly add or subtract coins
		elif is_click_on_sprite(event.position, target_sprite_5):
			print("Clicked on PointE")
			target_position = target_sprite_5.position
			moving = true
			$CoinManager.handle_coin_change()  # Randomly add or subtract coins
		elif is_click_on_sprite(event.position, target_sprite_6):
			print("Clicked on PointF")
			target_position = target_sprite_6.position
			moving = true
			$CoinManager.handle_coin_change()  # Randomly add or subtract coins


# Check if the mouse click is on a sprite with a custom clickable area.
func is_click_on_sprite(mouse_position, sprite):
	if not sprite.texture:  # Ensure the sprite has a texture
		return false
	
	# Define custom clickable area (smaller than the texture size)
	var custom_size = Vector2(50, 50)  # Set the size to something smaller (adjust as needed)
	
	# Use the sprite's global position and custom size for accurate detection
	var sprite_global_position = sprite.global_position
	var sprite_rect = Rect2(sprite_global_position - custom_size / 2, custom_size)
	
	# Check if the mouse position is within the custom clickable area
	return sprite_rect.has_point(mouse_position)
