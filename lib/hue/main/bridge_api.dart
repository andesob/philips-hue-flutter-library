import 'package:http/http.dart';
import 'package:philips_hue_flutter_library/hue/groups/group.dart';
import 'package:philips_hue_flutter_library/hue/groups/group_api.dart';
import 'package:philips_hue_flutter_library/hue/lights/light.dart';
import 'package:philips_hue_flutter_library/hue/lights/light_api.dart';
import 'package:philips_hue_flutter_library/hue/lights/light_state.dart';
import 'package:philips_hue_flutter_library/hue/main/bridge.dart';
import 'package:philips_hue_flutter_library/hue/main/setup_api.dart';
import 'package:philips_hue_flutter_library/hue/scenes/scene.dart';
import 'package:philips_hue_flutter_library/hue/scenes/scene_api.dart';

class BridgeApi {
  final SetupApi _setupApi;
  final LightApi _lightApi;
  final SceneApi _sceneApi;
  final GroupApi _groupApi;

  List<Light> list;

  String _username;


  BridgeApi(Client client, String address)
      : this._init(
          LightApi(Bridge(client, address)),
          SceneApi(Bridge(client, address)),
          GroupApi(Bridge(client, address)),
          SetupApi(Bridge(client, address)),
        );

  /// Initialized all API classes
  BridgeApi._init(
    this._lightApi,
    this._sceneApi,
    this._groupApi,
    this._setupApi,
  );

  set username(String username) {
    this._username = username;
    _groupApi.username = username;
    _sceneApi.username = username;
    _lightApi.username = username;
  }

  /// Method called to create new user
  Future<Map<String, dynamic>> createUser(String name) async {
    return await _setupApi.createUser(name);
  }

  /// Method called to get information about all Lights
  Future<List<Light>> getLights() async {
    return await _lightApi.getAll();
  }

  /// Method called to get information about all Scenes
  Future<List<Scene>> getScenes() async {
    return await _sceneApi.getAll();
  }

  /// Method called to get information about all Groups
  Future<List<Group>> getGroups() async {
    return await _groupApi.getAll();
  }

  /// Method called to change scene in specific group
  Future<void> changeScene(String sceneId, groupId) async {
    return await _groupApi.changeScene(sceneId, groupId);
  }

  /// Method called to update the LightState of specific Light
  Future<void> updateLightState(String id, LightState state) async {
    return await _lightApi.updateState(id, state);
  }
}
