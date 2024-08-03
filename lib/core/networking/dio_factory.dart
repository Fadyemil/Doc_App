import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  /// private constructor as I don't want to allow creating an instance of this class
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      addDioInterceptor();
      addDioHandler();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioHandler() {
    dio?.options.headers = {
      'Accept': 'application/json',
      'Authorization':
          'Bearer ${'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3ZjYXJlLmludGVncmF0aW9uMjUuY29tL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNzIyNzAxMDE2LCJleHAiOjE3MjI3ODc0MTYsIm5iZiI6MTcyMjcwMTAxNiwianRpIjoiM25Na1RXdW5Od1RaVEpRbSIsInN1YiI6IjE3MDkiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.RYFJHOjU507JYugCKRtbP1PPATzye9E9LssaznXMjv8'}', 
    };
  }

  /// send in tremaile Response and request
  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}
