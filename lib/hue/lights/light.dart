import 'light_state.dart';

class Light {
  /// Name if the Light
  final String _name;

  /// Type of Light
  final String _type;

  /// ID of the Light
  final String _id;

  /// State of the Light
  final LightState _state;

  /// ID of the model of Light
  final String _modelId;

  /// Unique ID for this specific Light
  final String _uniqueId;

  /// Name of the manufacturer
  final String _manufacturerName;

  /// Name of the product
  final String _productName;

  /// Unique lumionaire ID for the Light
  final String _luminaireUniqueId;

  /// The software version of the Light
  final String _swVersion;

  Light(
      this._name,
      this._type,
      this._id,
      this._state,
      this._modelId,
      this._uniqueId,
      this._manufacturerName,
      this._productName,
      this._luminaireUniqueId,
      this._swVersion);

  /// Creates a Light object from JSON data
  Light.fromJson(Map<String, dynamic> json, id)
      : _name = json["name"],
        _type = json["type"],
        _id = id,
        _state = LightState.fromJson(json["state"]),
        _modelId = json["modelid"],
        _uniqueId = json["uniqueid"],
        _manufacturerName = json["manufacturername"],
        _productName = json["productname"],
        _luminaireUniqueId = json["luminaireuniqueid"],
        _swVersion = json["swversion"];

  String get swVersion => _swVersion;

  String get luminaireUniqueId => _luminaireUniqueId;

  String get productName => _productName;

  String get manufacturerName => _manufacturerName;

  String get uniqueId => _uniqueId;

  String get modelId => _modelId;

  LightState get state => _state;

  String get id => _id;

  String get type => _type;

  String get name => _name;

  /// Creates a map from a Light object
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = new Map();
    map["name"] = _name;
    map["type"] = _type;
    map["id"] = _id;
    map["state"] = _state.toMap();
    map["modelid"] = _modelId;
    map["uniqueid"] = _uniqueId;
    map["manufacturername"] = _manufacturerName;
    map["productname"] = _productName;
    map["luminaireuniqueid"] = _luminaireUniqueId;
    map["swversion"] = _swVersion;
    return map;
  }

  @override
  String toString() {
    StringBuffer sb = new StringBuffer();
    sb
      ..writeln("Name: " + _name)
      ..writeln("Type: " + _type)
      ..writeln("ID: " + _id.toString())
      ..writeln("\nState: \n" + _state.toString())
      ..writeln("Model ID: " + _modelId)
      ..writeln("Unique ID: " + _uniqueId)
      ..writeln("Manufacturer name: " + _manufacturerName)
      ..writeln("Product name: " + _productName)
      ..writeln("Luminaire Unique ID: " + _swVersion);

    return sb.toString();
  }
}
