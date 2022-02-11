import 'package:json_annotation/json_annotation.dart';
part 'category_response_dto.g.dart';

@JsonSerializable()
class CategoryResponseDTO {

  @JsonKey(name: "categories")
  List<CategoryView>? data;

  CategoryResponseDTO();

  factory CategoryResponseDTO.fromJson(Map<String, dynamic> json) => _$CategoryResponseDTOFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryResponseDTOToJson(this);
}


@JsonSerializable()
class CategoryView {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(ignore: true)
  bool isSelected;

  CategoryView({this.isSelected = false});
  factory CategoryView.fromJson(Map<String, dynamic> json) => _$CategoryViewFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryViewToJson(this);
}
