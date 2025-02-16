extends Node

# Declare the coin count variable and set the starting amount
var coin_count: int = 100

# Declare the CoinLabel as a variable
var coin_label: Label

# Called when the node enters the scene tree for the first time.
func _ready():
	# Attempt to find the CoinLabel node
	coin_label = $CoinLabel  # This assumes CoinLabel is a child node of CoinManager.
	
	# Check if the CoinLabel is found
	if coin_label == null:
		print("Error: CoinLabel not found!")
		return
	
	# Update the coin count and label
	update_coin_label()

# Function to add a random number of coins
func add_random_coins():
	# Random amount between 1 and 10 to add
	var random_amount = randi_range(1, 10)
	coin_count += random_amount
	update_coin_label()

# Function to subtract a random number of coins
func subtract_random_coins():
	# Random amount between 1 and 10 to subtract
	var random_amount = randi_range(1, 10)
	coin_count -= random_amount
	coin_count = max(coin_count, 0)  # Prevent negative coin count
	update_coin_label()

# Function to handle coin change with 50/50 chance
func handle_coin_change():
	# Generate a random number, 0 or 1
	var random_choice = randi_range(0, 1)
	
	# 50% chance to either add or subtract coins
	if random_choice == 0:
		add_random_coins()
		print("Added coins.")
	else:
		subtract_random_coins()
		print("Subtracted coins.")

# Function to update the coin count label
func update_coin_label():
	coin_label.text = "Coins: " + str(coin_count)
