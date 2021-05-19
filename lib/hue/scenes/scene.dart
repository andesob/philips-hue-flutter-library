class Scene {
  /// ID of the Scene
  final String _id;

  /// Name of the Scene
  final String _name;

  /// Type of the Scene
  final String _type;

  /// Group of the Scene
  final String _group;

  /// List with Lights in the Scene
  final List<int> _lights;

  /// Owner of the Scene
  final String _owner;

  /// True if Scene can be recycled
  final bool _recycle;

  /// True if Scene is locked
  final bool _locked;

  /// When the Scene was last updated
  final String _lastUpdated;

  /// Current software version
  final int _version;

  Scene(
      this._id,
      this._name,
      this._type,
      this._group,
      this._lights,
      this._owner,
      this._recycle,
      this._locked,
      this._lastUpdated,
      this._version);

  /// Creates a Scene object from JSON data
  Scene.fromJson(Map<String, dynamic> json, this._id)
      : _name = json["name"],
        _type = json["type"],
        _group = json["group"],
        _lights = json["lights"].map((stringId) => int.parse(stringId)).toList().cast<int>(),
        _owner = json["owner"],
        _recycle = json["recycle"],
        _locked = json["locked"],
        _lastUpdated = json["lastupdated"],
        _version = json["version"];

  int get version => _version;

  String get lastUpdated => _lastUpdated;

  bool get locked => _locked;

  bool get recycle => _recycle;

  String get owner => _owner;

  List<int> get lights => _lights;

  String get group => _group;

  String get type => _type;

  String get name => _name;

  String get id => _id;

  /// Creates a map from a Scene object
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = new Map();
    map["name"] = _name;
    map["type"] = _type;
    map["group"] = _group;
    map["lights"] = _lights;
    map["owner"] = _owner;
    map["recycle"] = _recycle;
    map["locked"] = _locked;
    map["lastupdated"] = _lastUpdated;
    map["version"] = _version;
    return map;
  }

  @override
  String toString() {
    StringBuffer sb = new StringBuffer();
    sb
      ..writeln("id: " + _id)
      ..writeln("name: " + _name)
      ..writeln("type: " + _type)
      ..writeln("group: " + _group)
      ..writeln("lights: " + _lights.toString())
      ..writeln("owner: " + _owner)
      ..writeln("recycle: " + _recycle.toString())
      ..writeln("locked: " + _locked.toString())
      ..writeln("lastupdated: " + _lastUpdated)
      ..writeln("version: " + _version.toString());
    return sb.toString();
  }
}
