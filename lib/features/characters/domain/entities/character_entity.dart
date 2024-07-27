import 'package:equatable/equatable.dart';

class CharacterEntity extends Equatable {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String name;
  final String role;

  const CharacterEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.name,
    required this.role,
  });

  @override
  List<Object> get props => [
        id,
        title,
        description,
        imageUrl,
        name,
        role,
      ];
}
