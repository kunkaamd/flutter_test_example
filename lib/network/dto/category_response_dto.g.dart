// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryResponseDTO _$CategoryResponseDTOFromJson(Map<String, dynamic> json) =>
    CategoryResponseDTO()
      ..data = (json['data'] as List<dynamic>?)
          ?.map((e) => CategoryView.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$CategoryResponseDTOToJson(
        CategoryResponseDTO instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

CategoryView _$CategoryViewFromJson(Map<String, dynamic> json) => CategoryView()
  ..id = json['ID'] as int?
  ..name = json['Name'] as String?;

Map<String, dynamic> _$CategoryViewToJson(CategoryView instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Name': instance.name,
    };
