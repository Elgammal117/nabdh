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
class NumberVerifyRespons {
  String? accessToken;
  String? refreshToken;
  bool? isNewUser;
  User? user;

  NumberVerifyRespons({
    this.accessToken,
    this.refreshToken,
    this.isNewUser,
    this.user,
  });

  factory NumberVerifyRespons.fromJson(Map<String, dynamic> json) =>
      _$NumberVerifyResponsFromJson(json);

  Map<String, dynamic> toJson() => _$NumberVerifyResponsToJson(this);

  static const jsonSchema = _$NumberVerifyResponsJsonSchema;
}

@JsonSerializable(createJsonSchema: true)
class User {
  String? id;
  String? phone;
  String? type;

  User({this.id, this.phone, this.type});

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
