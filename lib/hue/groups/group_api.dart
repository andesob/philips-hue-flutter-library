import 'package:philips_hue_flutter_library/hue/groups/group.dart';
import 'dart:developer' as developer;

import 'package:philips_hue_flutter_library/hue/main/bridge.dart';

class GroupApi {
  /// Bridge used to make calls
  Bridge _bridge;

  /// Current username
  String _username;

  GroupApi(this._bridge, [this._username]);

  String get username => _username;

  Bridge get bridge => _bridge;


  set username(String value) {
    _username = value;
  }

  /// Retrieves information about all Groups from the Bridge
  Future<List<Group>> getAll() async {
    String url = '/api/' + _username + '/groups';
    final response = await _bridge.get(url);
    final groups = <Group> [];
    for(String id in response.keys){
      Map<String, dynamic> groupMap = response[id];
      final group = Group.fromJson(groupMap, id);
      groups.add(group);
    }
    return groups;
  }

  /// Changes the scene on current Group
  Future<void> changeScene(String sceneId, String groupId) async {
    String url = '/api/' + _username + '/groups/' + groupId + '/action';
    final response = await _bridge.put(url, {'scene': sceneId});
    developer.log("Scene changed: " + response[0].toString());
  }
}