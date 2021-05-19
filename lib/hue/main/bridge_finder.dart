import 'dart:convert';
import 'package:http/http.dart';
import 'package:philips_hue_flutter_library/hue/main/bridge_finder_result.dart';

class BridgeFinder{
  /// Client used to make calls
  Client _client;

  BridgeFinder(this._client);

  /// Automatically finds the first Bridge on the same network
  Future<List<BridgeFinderResult>> automatic() async {
    final url = "https://discovery.meethue.com/";
    final response = await _client.get(url);
    List jsonResponse = json.decode(response.body);
    final result = <BridgeFinderResult> [];
    for (Map<String, dynamic> json in jsonResponse){
      result.add(BridgeFinderResult.fromJson(json));
    }

    return result;
  }

  /// Manually connect to a specific Bridge on the same network
  Future<BridgeFinderResult> manual(String ipAddress) async {
    final url = "http://$ipAddress/api/hue/config";
    final response = await _client.get(url);
    Map jsonResponse = json.decode(response.body);
    final result = BridgeFinderResult.fromJson(jsonResponse);
    return result;
  }
}