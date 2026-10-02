class_name CurrencyResource
extends Resource

## Name of the currency
@export var name: String = 'Placeholder'
## How much does a player currently have of a given currency
@export var amount: int = 100
## Amount the player gains every turn
@export var income: int = 5
## Amount the player loses every turn
@export var upkeep: int = -1
## The icon that represents the resource
@export var icon: Texture2D = preload('res://resources/icons/skull.tres')