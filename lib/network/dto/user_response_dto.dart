import 'package:json_annotation/json_annotation.dart';
part 'user_response_dto.g.dart';

@JsonSerializable()
class UserResponseDTO {

  @JsonKey(name: "accessToken")
  String? accessToken;

  @JsonKey(name: "id")
  int? id;

  UserResponseDTO();
  factory UserResponseDTO.fromJson(Map<String, dynamic> json) => _$UserResponseDTOFromJson(json);
  Map<String, dynamic> toJson() => _$UserResponseDTOToJson(this);
}