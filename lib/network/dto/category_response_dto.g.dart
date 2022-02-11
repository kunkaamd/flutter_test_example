// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryResponseDTO _$CategoryResponseDTOFromJson(Map<String, dynamic> json) =>
    CategoryResponseDTO()
      ..data = (json['categories'] as List<dynamic>?)
          ?.map((e) => CategoryView.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$CategoryResponseDTOToJson(
        CategoryResponseDTO instance) =>
    <String, dynamic>{
      'categories': instance.data,
    };

CategoryView _$CategoryViewFromJson(Map<String, dynamic> json) => CategoryView()
  ..id = json['id'] as int?
  ..name = json['name'] as String?;

Map<String, dynamic> _$CategoryViewToJson(CategoryView instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
