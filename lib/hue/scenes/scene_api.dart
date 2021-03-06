import 'package:philips_hue_flutter_library/hue/main/bridge.dart';
import 'package:philips_hue_flutter_library/hue/scenes/scene.dart';

class SceneApi{
  /// Bridge used to make calls
  Bridge _bridge;

  /// Current username
  String _username;

  SceneApi(this._bridge, [this._username]);

  String get username => _username;

  Bridge get bridge => _bridge;

  set username(String value) {
    _username = value;
  }

  /// Retrieves information about all Scenes from the Bridge
  Future<List<Scene>> getAll() async{
    String url = '/api/' + _username + "/scenes";
    final response = await _bridge.get(url);
    final scenes = <Scene> [];
    for (String id in response.keys){
      Map<String, dynamic> item = response[id];
      final scene = Scene.fromJson(item, id);
      scenes.add(scene);
    }

    return scenes;
  }
}