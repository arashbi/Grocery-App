
import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:f_groceries/logind_signup.dart';
import 'package:f_groceries/model/serializers.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data_model.g.dart';

abstract class ProductDto implements Built<ProductDto, ProductDtoBuilder> {
  num get id;
  String get name;
  String get status;
  String get description;
  String get price;
  BuiltList<ImageDto> get images;

  ProductDto._();
  factory ProductDto([void Function(ProductDtoBuilder) updates]) = _$ProductDto;
  static Serializer<ProductDto> get serializer => _$productDtoSerializer;
  factory ProductDto.fromJson(String source ) => serializers.deserializeWith(serializer, jsonDecode(source));
}

abstract class CategoryDto implements Built<CategoryDto, CategoryDtoBuilder> {
  int get id;
  String get name;
  @nullable
  ImageDto get image;

  CategoryDto._();
  factory CategoryDto([void Function(CategoryDtoBuilder) updates]) = _$CategoryDto;
  static Serializer<CategoryDto> get serializer => _$categoryDtoSerializer;
  factory CategoryDto.fromJson(String source ) => serializers.deserializeWith(serializer, jsonDecode(source));
}
abstract class ImageDto implements Built<ImageDto, ImageDtoBuilder> {
  String get src;
  String get alt;
  ImageDto._();
  factory ImageDto([void Function(ImageDtoBuilder) updates]) = _$ImageDto;
  static Serializer<ImageDto> get serializer => _$imageDtoSerializer;
  factory ImageDto.fromJson(String source ) => serializers.deserializeWith(serializer, jsonDecode(source));
}
