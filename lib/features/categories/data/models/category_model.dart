import 'package:anime_app/features/categories/domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({
    required super.id,
    required super.title,
    required super.description,
  });

  // Factory constructor to create an instance from JSON
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      title: json['attributes']['title'],
      description: json['attributes']['description'],
    );
  }
}