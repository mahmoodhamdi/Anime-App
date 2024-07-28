import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final String id;
  final String description;
  final String title;

  const CategoryEntity({
    required this.id,
    required this.description,
    required this.title,
  });

  @override
  List<Object> get props => [
        id,
        description,
        title,
      ];
}
