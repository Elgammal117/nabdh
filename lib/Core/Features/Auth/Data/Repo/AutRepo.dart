import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:nabdh/Core/Features/Auth/Data/Models/AuthModels.dart';
import 'package:nabdh/dio_helper.dart';

class AuthRepo {
  Future<Either<String, String>> numberotpsend({
    required String phoneNumber,
    required String role,
  }) async {
    try {
      var response = await dio.post(
        'auth/otp/send',
        data: {'phone': phoneNumber, 'role': role},
      );

      var mapResponse = response.data as Map<String, dynamic>;
      OtpSendRespons otpsendrespons = OtpSendRespons.fromJson(mapResponse);

      return right(otpsendrespons.message!);
    } catch (e) {
      return left(handleDioException(e));
    }
  }

  Future<Either<String, NumberVerifyRespons>> numberotpverify({
    required String phoneNumber,
    required String code,
    required String role,
    Map<String, dynamic>? deviceinfo,
  }) async {
    try {
      var response = await dio.post(
        'auth/otp/verify',
        data: {
          'phone': phoneNumber,
          'code': code,
          'role': role,
          'deviceinfo': deviceinfo,
        },
      );

      var mapResponse = response.data as Map<String, dynamic>;
      NumberVerifyRespons numberverifyrespons = NumberVerifyRespons.fromJson(
        mapResponse,
      );

      return right(numberverifyrespons);
    } catch (e) {
      return left(handleDioException(e));
    }
  }

  Future<Either<String, RefreshTokkenRespons>> refreshtokenrequiest({
    required String refreshToken,
  }) async {
    try {
      var response = await dio.post(
        'auth/refresh',

        data: {'refreshToken': refreshToken},
      );

      var mapResponse = response.data as Map<String, dynamic>;
      RefreshTokkenRespons refreshtokkenrespons = RefreshTokkenRespons.fromJson(
        mapResponse,
      );

      return right(refreshtokkenrespons);
    } catch (e) {
      return left(handleDioException(e));
    }
  }
}
