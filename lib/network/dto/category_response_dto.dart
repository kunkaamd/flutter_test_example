import 'package:json_annotation/json_annotation.dart';
part 'category_response_dto.g.dart';

@JsonSerializable()
class CategoryResponseDTO {

  @JsonKey(name: "data")
  List<CategoryView>? data;

  CategoryResponseDTO();

  factory CategoryResponseDTO.fromJson(Map<String, dynamic> json) => _$CategoryResponseDTOFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryResponseDTOToJson(this);
}


@JsonSerializable()
class CategoryView {
  @JsonKey(name: 'ID')
  int? id;

  @JsonKey(name: 'Name')
  String? name;

  CategoryView();
  factory CategoryView.fromJson(Map<String, dynamic> json) => _$CategoryViewFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryViewToJson(this);
}
