import 'package:philips_hue_flutter_library/hue/groups/group_action.dart';
import 'package:philips_hue_flutter_library/hue/groups/group_state.dart';

class Group {
  ///ID of the Group
  final String _id;

  /// Type of Group
  final String _type;

  /// Name of the Group
  final String _name;

  /// List of all the lights in the Group
  final List<int> _lights;

  /// The state of the Group
  final GroupState _state;

  /// The action of the Group
  final GroupAction _action;

  Group(
    this._id,
    this._type,
    this._name,
    this._lights,
    this._state,
    this._action,
  );

  /// Creates a Group object from JSON data
  Group.fromJson(Map<String, dynamic> json, this._id)
      : _type = json["type"],
        _name = json["name"],
        _lights = json["lights"].cast<int>(),
        _state = GroupState.fromJson(json["state"]),
        _action = GroupAction.fromJson(json["action"]);

  GroupAction get action => _action;

  GroupState get state => _state;

  List<int> get lights => _lights;

  String get name => _name;

  String get id => _id;
}
