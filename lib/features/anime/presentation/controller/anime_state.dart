part of 'anime_bloc.dart';

abstract class AnimeState extends Equatable {
  const AnimeState();

  @override
  List<Object> get props => [];
}

class AnimeInitial extends AnimeState {}

class AnimeLoading extends AnimeState {}

class AnimeLoaded extends AnimeState {
  final List<AnimeEntity> animeList;

  const AnimeLoaded(this.animeList);

  @override
  List<Object> get props => [animeList];
}

class AnimeDetailsLoaded extends AnimeState {
  final AnimeEntity animeDetails;

  const AnimeDetailsLoaded(this.animeDetails);

  @override
  List<Object> get props => [animeDetails];
}

class AnimeError extends AnimeState {
  final Failure failure;

  const AnimeError(this.failure);

  @override
  List<Object> get props => [failure];
}
