import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:alerta/utils/logger.dart';
import 'dio_service.dart';

class LocationService {
  // Create
  static Future addLocation(formData) async {
    Logs.p.i(formData);

    var body = jsonEncode(formData, toEncodable: myEncode);
    Logs.p.i(body);
    try {
      final response = await dio.post('/locations',
          data: body,
          options: Options(
            headers: {
              'content-type': 'application/json',
              'Access-Control-Allow-Origin': 'true'
            },
          ));
      if (response.statusCode == 201) {
        return response.data['status'];
      } else {
        throw Exception("Error");
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.receiveTimeout) {
        throw Exception("Connection Timeout Exception");
      }
      throw Exception(e.message);
    }
  }
}

dynamic myEncode(dynamic item) {
  if (item is DateTime) {
    return item.toIso8601String();
  }
  return item;
}
