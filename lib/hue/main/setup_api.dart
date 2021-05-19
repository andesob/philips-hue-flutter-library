import 'bridge.dart';

class SetupApi {
  /// Bridge used to make calls
  Bridge _bridge;

  SetupApi(this._bridge);

  Bridge get bridge => _bridge;

  /// Creates a new user with a specific username
  Future<Map<String, dynamic>> createUser(String name) async {
    final String url = "/api";
    final response = await _bridge.post(url, {'devicetype': name});
    final Map<String, dynamic> responseMap = response[0];
    return responseMap;
  }
}