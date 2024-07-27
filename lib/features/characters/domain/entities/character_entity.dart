import 'package:equatable/equatable.dart';

class CharacterEntity extends Equatable {
  final String id;
  final String description;
  final String imageUrl;
  final String name;

  const CharacterEntity({
    required this.id,
    required this.description,
    required this.imageUrl,
    required this.name,
  });

  @override
  List<Object> get props => [
        id,
        description,
        imageUrl,
        name,
      ];
}
