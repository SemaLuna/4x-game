class_name PlayerResource
extends Resource

## Name of the player
@export var name: String = 'Player1'
## Faction the player belongs to
@export var faction: FactionResource = preload('res://resources/factions/frogs.tres')
## Amount of gold a player has
@export var gold: CurrencyResource = preload('res://resources/currencies/gold.tres')