import 'package:dio/dio.dart';

Dio dio = Dio(BaseOptions(baseUrl: 'http://10.0.2.2:3000/api/v1/'));
String? accessToken;

String handleDioException(Object e) {
  if (e is DioException) {
    final statusCode = e.response?.statusCode;
    final responseData = e.response?.data;
    print('DioException status: $statusCode');
    print('DioException data: $responseData');

    if (responseData is Map<String, dynamic>) {
      final errorMsg = responseData['message']?.toString();
      return errorMsg ?? 'Request failed with status code $statusCode';
    }

    if (responseData != null) {
      return responseData.toString();
    }

    return 'Request failed with status code $statusCode';
  } else {
    print(e.toString());
    return 'Error Happened try again later';
  }
}
