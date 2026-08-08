import 'package:json_annotation/json_annotation.dart';

part 'AuthModels.g.dart';

@JsonSerializable(createJsonSchema: true)
class OtpSendRespons {
  String? message;

  OtpSendRespons({this.message});

  factory OtpSendRespons.fromJson(Map<String, dynamic> json) =>
      _$OtpSendResponsFromJson(json);

  Map<String, dynamic> toJson() => _$OtpSendResponsToJson(this);

  static const jsonSchema = _$OtpSendResponsJsonSchema;
}

@JsonSerializable(createJsonSchema: true)
class OtpVerifyRespons {
  String? accessToken;
  String? refreshToken;
  bool? isNewUser;
  User? user;

  OtpVerifyRespons({
    this.accessToken,
    this.refreshToken,
    this.isNewUser,
    this.user,
  });

  factory OtpVerifyRespons.fromJson(Map<String, dynamic> json) =>
      _$OtpVerifyResponsFromJson(json);

  Map<String, dynamic> toJson() => _$OtpVerifyResponsToJson(this);

  static const jsonSchema = _$OtpVerifyResponsJsonSchema;
}

@JsonSerializable(createJsonSchema: true)
class User {
  String? id;
  String? email;
  String? type;

  User({this.id, this.email, this.type});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  static const jsonSchema = _$UserJsonSchema;
}

@JsonSerializable(createJsonSchema: true)
class RefreshTokkenRespons {
  String? accessToken;
  String? refreshToken;

  RefreshTokkenRespons({this.accessToken, this.refreshToken});
  factory RefreshTokkenRespons.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokkenResponsFromJson(json);

  Map<String, dynamic> toJson() => _$RefreshTokkenResponsToJson(this);

  static const jsonSchema = _$RefreshTokkenResponsJsonSchema;
}
