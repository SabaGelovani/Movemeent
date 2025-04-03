extends Node

var money = 100  # Starting coins
var fuel = 10  # Starting fuel

@onready var coin_label = $CoinLabel  
@onready var fuel_label = $FuelLabel  

func _ready():
	update_labels()

# Function to update money
func update_money(amount):
	money += amount
	update_labels()
	print("Updated Money:", money)

# Function to get money
func get_money():
	return money

# Function to set money (used for loading save data)
func set_money(value):
	money = value
	update_labels()
	print("Set Money to:", money)

# Function to update fuel
func update_fuel(amount):
	fuel += amount
	update_labels()
	print("Updated Fuel:", fuel)

# Function to get fuel
func get_fuel():
	return fuel

# Function to set fuel (used for loading save data)
func set_fuel(value):
	fuel = value
	update_labels()
	print("Set Fuel to:", fuel)

# Function to refresh labels
func update_labels():
	if coin_label and fuel_label:
		coin_label.text = "Coins: " + str(money)
		fuel_label.text = "Fuel: " + str(fuel)
	else:
		print("Error: CoinLabel or FuelLabel not found!")
