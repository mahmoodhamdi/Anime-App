import 'package:equatable/equatable.dart';

class MediaCharacterEntity extends Equatable {
  const MediaCharacterEntity({
    required this.id,
  });

  final String id;

  @override
  List<Object?> get props => [id];
}
