import 'package:alerta/utils/logger.dart';
import 'package:dio/dio.dart';
import 'package:alerta/globals/environment.dart';

final options = BaseOptions(
  baseUrl: Environment.apiUrl,
  connectTimeout: const Duration(seconds: 5),
  receiveTimeout: const Duration(seconds: 3),
  receiveDataWhenStatusError: true,
  responseType: ResponseType.json,
);

Dio dio = Dio(options);

class CustomInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    Logs.p.i("onRequest");
    return super.onRequest(options, handler);
  }

  @override
  Future? onResponse(Response response, ResponseInterceptorHandler handler) {
    Logs.p.i("onResponse");
    return null;
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    Logs.p.e("onError: ${err.response!.statusCode}");
    return handler.next(err); // <--- THE TIP IS HERE
  }
}
