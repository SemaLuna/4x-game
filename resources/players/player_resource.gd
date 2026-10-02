extends Resource
class_name PlayerResource

## Name of the player
@export var name = 'Player1'
@export var faction: FactionResource = preload('res://resources/factions/frogs.tres')
@export var gold: CurrencyResource = preload('res://resources/currencies/gold.tres')