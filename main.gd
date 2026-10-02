extends Node

var _player: PlayerResource

func initialize_player(scene_name: Utils.SceneNames) -> void:
    match scene_name:
        Utils.SceneNames.Main:
            _player = null
        _:
            _player = PlayerResource.new()