import 'package:dartz/dartz.dart';
import 'package:nabdh/Core/Features/Auth/Data/Models/AuthModels.dart';
import 'package:nabdh/dio_helper.dart';

class AuthRepo {
  Future<Either<String, String>> emailotpsend({
    required String email,
    required String role,
  }) async {
    try {
      print("imhere");
      print(email);
      print(role);
      var response = await dio.post(
        'auth/otp/send',
        data: {'email': email, 'role': role},
      );

      var mapResponse = response.data as Map<String, dynamic>;
      OtpSendRespons otpsendrespons = OtpSendRespons.fromJson(mapResponse);

      return right(otpsendrespons.message!);
    } catch (e) {
      return left(handleDioException(e));
    }
  }

  Future<Either<String, OtpVerifyRespons>> emailotpverify({
    required String email,
    required String code,
    required String role,
  }) async {
    try {
      print(email);
      print(code);
      print(role);
      var response = await dio.post(
        'auth/otp/verify',

        data: {'email': email, 'code': code, 'role': role},
      );

      var mapResponse = response.data as Map<String, dynamic>;
      OtpVerifyRespons otpverifyrespons = OtpVerifyRespons.fromJson(
        mapResponse,
      );

      return right(otpverifyrespons);
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
