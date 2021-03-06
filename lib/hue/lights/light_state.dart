class LightState {
  /// True if Light is turned on
  bool _on;

  /// Brightness of the Light
  int _brightness;

  /// Hue of the Light
  int _hue;

  /// Saturation of the Light
  int _saturation;

  /// List with XY values of the Light
  List<dynamic> _xy;

  /// CT Value of the Light
  int _ct;
  String _alert;

  /// Effect of the Light
  String _effect;

  /// Colormode of the Light
  String _colormode;

  /// True if Light can be reached
  bool _reachable;

  LightState(
    this._on,
    this._brightness,
    this._hue,
    this._saturation,
    this._xy,
    this._ct,
    this._alert,
    this._effect,
    this._colormode,
    this._reachable,
  );

  /// Creates a LightState object from JSON data
  LightState.fromJson(Map<String, dynamic> json)
      : _on = json["on"],
        _brightness = json["bri"],
        _hue = json["hue"],
        _saturation = json["sat"],
        _effect = json["effect"],
        _xy = json["xy"],
        _ct = json["ct"],
        _alert = json["alert"],
        _colormode = json["colormode"],
        _reachable = json["reachable"];

  set on(bool value) {
    _on = value;
  }

  bool get reachable => _reachable;

  String get colormode => _colormode;

  String get effect => _effect;

  String get alert => _alert;

  List<num> get xy => _xy;

  int get ct => _ct;

  int get saturation => _saturation;

  int get hue => _hue;

  int get brightness => _brightness;

  bool get on => _on;

  /// Creates a map from a LightState object
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = new Map();
    map["on"] = _on;
    map["bri"] = _brightness;
    map["hue"] = _hue;
    map["sat"] = _saturation;
    map["effect"] = _effect;
    map["xy"] = _xy;
    map["ct"] = _ct;
    map["alert"] = _alert;
    return map;
  }

  @override
  String toString() {
    StringBuffer sb = new StringBuffer();
    sb
      ..writeln("On: " + _on.toString())
      ..writeln("Brightness: " + _brightness.toString())
      ..writeln("Hue: " + _hue.toString())
      ..writeln("Saturation: " + _saturation.toString())
      ..writeln("XY: " + _xy.toString())
      ..writeln("CT: " + _ct.toString())
      ..writeln("Alert: " + _alert)
      ..writeln("Effect: " + _effect)
      ..writeln("Colormode: " + _colormode)
      ..writeln("Reachable: " + _reachable.toString());
    return sb.toString();
  }

  set brightness(int value) {
    _brightness = value;
  }

  set hue(int value) {
    _hue = value;
  }

  set saturation(int value) {
    _saturation = value;
  }

  set xy(List<dynamic> value) {
    _xy = value;
  }

  set ct(int value) {
    _ct = value;
  }

  set alert(String value) {
    _alert = value;
  }

  set effect(String value) {
    _effect = value;
  }

  set colormode(String value) {
    _colormode = value;
  }

  set reachable(bool value) {
    _reachable = value;
  }
}
