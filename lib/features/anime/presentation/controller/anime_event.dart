import 'package:equatable/equatable.dart';

abstract class AnimeEvent extends Equatable {
  const AnimeEvent();
  @override
  List<Object> get props => [];
}

class AnimeInitialEvent extends AnimeEvent {}

class GetTopRatedAnimeEvent extends AnimeEvent {
  final int page;
  const GetTopRatedAnimeEvent({this.page = 1});
}

class GetPopularAnimeEvent extends AnimeEvent {
  final int page;
  const GetPopularAnimeEvent({this.page = 1});
}

class GetLatestAnimeEvent extends AnimeEvent {
  final int page;
  const GetLatestAnimeEvent({required this.page});
}

class GetAnimeDetailsEvent extends AnimeEvent {
  final int id;
  const GetAnimeDetailsEvent({required this.id});
}
