import 'package:json_annotation/json_annotation.dart';

part 'user_request_dto.g.dart';

@JsonSerializable()
class UserRequestDTO {
  @JsonKey(name: "Email")
  String email;

  @JsonKey(name: "Password")
  String password;

  @JsonKey(name: "AppVersion")
  String appVersion;

  @JsonKey(name: "DeviceId")
  String deviceId;

  @JsonKey(name: "OSVersion")
  String osVersion;

  UserRequestDTO({
    required this.email,
    required this.password,
    required this.appVersion,
    required this.deviceId,
    required this.osVersion,
  });

  factory UserRequestDTO.fromJson(Map<String, dynamic> json) =>
      _$UserRequestDTOFromJson(json);

  Map<String, dynamic> toJson() => _$UserRequestDTOToJson(this);
}
