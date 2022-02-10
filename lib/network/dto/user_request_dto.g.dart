// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRequestDTO _$UserRequestDTOFromJson(Map<String, dynamic> json) =>
    UserRequestDTO(
      email: json['Email'] as String,
      password: json['Password'] as String,
      appVersion: json['AppVersion'] as String,
      deviceId: json['DeviceId'] as String,
      osVersion: json['OSVersion'] as String,
    );

Map<String, dynamic> _$UserRequestDTOToJson(UserRequestDTO instance) =>
    <String, dynamic>{
      'Email': instance.email,
      'Password': instance.password,
      'AppVersion': instance.appVersion,
      'DeviceId': instance.deviceId,
      'OSVersion': instance.osVersion,
    };
