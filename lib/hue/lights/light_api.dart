import 'package:philips_hue_flutter_library/hue/lights/light.dart';
import 'package:philips_hue_flutter_library/hue/lights/light_state.dart';
import 'dart:developer' as developer;

import 'package:philips_hue_flutter_library/hue/main/bridge.dart';

class LightApi{
  /// Bridge used to make calls
  Bridge _bridge;

  /// Current username
  String _username;

  LightApi(this._bridge, [this._username]);

  String get username => _username;

  Bridge get bridge => _bridge;

  set username(String value) {
    _username = value;
  }

  /// Retrieves information about all Lights from the Bridge
  Future<List<Light>> getAll() async {
    String url = '/api/' + _username + '/lights';
    final response = await _bridge.get(url);
    final lights = <Light> [];
    for(String id in response.keys){
      Map<String, dynamic> item = response[id];
      final light = Light.fromJson(item, id);
      lights.add(light);
    }

    return lights;
  }

  /// Updates the state of a specific Light
  Future<void> updateState(String id, LightState state) async {
    String url = '/api/' + _username + '/lights/' + id.toString() + '/state';
    final response = await _bridge.put(url, state.toMap());
    developer.log("Updated light state: " + response[0].toString());
  }

}