class GroupState {
  /// True if any lights in the Group are on
  final bool _anyOn;

  /// True if all of the lights in the Group are on
  final bool _allOn;

  GroupState(this._anyOn, this._allOn,);

  /// Creates a GroupState from JSON data
  GroupState.fromJson(Map<String, dynamic> json)
      : _anyOn = json["any_on"],
        _allOn = json["all_on"];

  bool get allOn => _allOn;

  bool get anyOn => _anyOn;


  /// Converts a GroupState into a map
  Map<String, dynamic> toMap(){
    Map<String, dynamic> map = new Map();
    map["any_on"] = _anyOn;
    map["all_on"] = _allOn;
    return map;
  }

  @override
  String toString() {
    StringBuffer sb = new StringBuffer();
    sb
    ..writeln("any_on: " + _anyOn.toString())
    ..writeln("all_on: " + _allOn.toString());
    return sb.toString();
  }
}
