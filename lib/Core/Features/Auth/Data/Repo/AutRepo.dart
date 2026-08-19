import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
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

  Future<Either<String, SignUpRespons>> SignUp({
    required String accessToken,
    required String fullName,
    required String gender,
    required String dateOfBirth,
    required String profilePhoto,
  }) async {
    try {
      var response = await dio.post(
        'patient/profile',
        data: {
          'fullName': fullName,
          'gender': gender,
          'dateOfBirth': dateOfBirth,
          'photoUrl': profilePhoto,
        },
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );

      var mapResponse = response.data as Map<String, dynamic>;
      SignUpRespons signUpRespons = SignUpRespons.fromJson(mapResponse);

      return right(signUpRespons);
    } catch (e) {
      return left(handleDioException(e));
    }
  }

  Future<Either<String, SignUpRespons>> getuser({
    required String accessToken,
  }) async {
    try {
      var response = await dio.get(
        'patient/profile',
        options: Options(headers: {'Authorization': 'Bearer $accessToken'}),
      );

      var mapResponse = response.data as Map<String, dynamic>;
      SignUpRespons signUpRespons = SignUpRespons.fromJson(mapResponse);

      return right(signUpRespons);
    } catch (e) {
      return left(handleDioException(e));
    }
  }
}
