// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AuthModels.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtpSendRespons _$OtpSendResponsFromJson(Map<String, dynamic> json) =>
    OtpSendRespons(message: json['message'] as String?);

Map<String, dynamic> _$OtpSendResponsToJson(OtpSendRespons instance) =>
    <String, dynamic>{'message': instance.message};

const _$OtpSendResponsJsonSchema = {
  r'$schema': 'https://json-schema.org/draft/2020-12/schema',
  'type': 'object',
  'properties': {
    'message': {'type': 'string'},
  },
};

OtpVerifyRespons _$OtpVerifyResponsFromJson(Map<String, dynamic> json) =>
    OtpVerifyRespons(
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
      isNewUser: json['isNewUser'] as bool?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OtpVerifyResponsToJson(OtpVerifyRespons instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'isNewUser': instance.isNewUser,
      'user': instance.user,
    };

const _$OtpVerifyResponsJsonSchema = {
  r'$schema': 'https://json-schema.org/draft/2020-12/schema',
  'type': 'object',
  'properties': {
    'accessToken': {'type': 'string'},
    'refreshToken': {'type': 'string'},
    'isNewUser': {'type': 'boolean'},
    'user': {r'$ref': r'#/$defs/User'},
  },
  r'$defs': {
    'User': {
      'type': 'object',
      'properties': {
        'id': {'type': 'string'},
        'email': {'type': 'string'},
        'type': {'type': 'string'},
      },
    },
  },
};

User _$UserFromJson(Map<String, dynamic> json) => User(
  id: json['id'] as String?,
  email: json['email'] as String?,
  type: json['type'] as String?,
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'type': instance.type,
};

const _$UserJsonSchema = {
  r'$schema': 'https://json-schema.org/draft/2020-12/schema',
  'type': 'object',
  'properties': {
    'id': {'type': 'string'},
    'email': {'type': 'string'},
    'type': {'type': 'string'},
  },
};

RefreshTokkenRespons _$RefreshTokkenResponsFromJson(
  Map<String, dynamic> json,
) => RefreshTokkenRespons(
  accessToken: json['accessToken'] as String?,
  refreshToken: json['refreshToken'] as String?,
);

Map<String, dynamic> _$RefreshTokkenResponsToJson(
  RefreshTokkenRespons instance,
) => <String, dynamic>{
  'accessToken': instance.accessToken,
  'refreshToken': instance.refreshToken,
};

const _$RefreshTokkenResponsJsonSchema = {
  r'$schema': 'https://json-schema.org/draft/2020-12/schema',
  'type': 'object',
  'properties': {
    'accessToken': {'type': 'string'},
    'refreshToken': {'type': 'string'},
  },
};

SignUpRespons _$SignUpResponsFromJson(Map<String, dynamic> json) =>
    SignUpRespons(
      sId: json['_id'] as String?,
      userId: json['userId'] as String?,
      iV: (json['__v'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      fullName: json['fullName'] as String?,
      gender: json['gender'] as String?,
      photoUrl: json['photoUrl'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$SignUpResponsToJson(SignUpRespons instance) =>
    <String, dynamic>{
      '_id': instance.sId,
      'userId': instance.userId,
      '__v': instance.iV,
      'createdAt': instance.createdAt,
      'dateOfBirth': instance.dateOfBirth,
      'fullName': instance.fullName,
      'gender': instance.gender,
      'photoUrl': instance.photoUrl,
      'updatedAt': instance.updatedAt,
    };

const _$SignUpResponsJsonSchema = {
  r'$schema': 'https://json-schema.org/draft/2020-12/schema',
  'type': 'object',
  'properties': {
    '_id': {'type': 'string'},
    'userId': {'type': 'string'},
    '__v': {'type': 'integer'},
    'createdAt': {'type': 'string'},
    'dateOfBirth': {'type': 'string'},
    'fullName': {'type': 'string'},
    'gender': {'type': 'string'},
    'photoUrl': {'type': 'string'},
    'updatedAt': {'type': 'string'},
  },
};
