import 'dart:convert';
import 'package:alerta/globals/environment.dart';
import 'package:alerta/utils/logger.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class LocationService {
  // Create
  static Future addLocation(formData) async {
    var bodyData = jsonEncode(formData, toEncodable: myEncode);

    Logs.p.i(bodyData.toString());

    final url = Uri.parse('${Environment.apiUrl}/locations');

    final response = await http.post(
      url,
      body: {
        "latitude": formData["latitude"].toString(),
        "longitude": formData["longitude"].toString(),
        "deviceId": formData["deviceId"].toString(),
        "accuracy": formData["accuracy"].toString(),
        "altitude": formData["altitude"].toString(),
        "heading": formData["heading"].toString(),
        "speed": formData["speed"].toString(),
        "speedAccuracy": formData["speedAccuracy"].toString(),
        "timestamp": formData["timestamp"].toString()
      },
    );

    return response.statusCode;
  }
}

dynamic myEncode(dynamic item) {
  if (item is DateTime) {
    return item.toIso8601String();
  }
  return item;
}
