import 'package:anime_app/core/dependency_injection/service_locator.dart';
import 'package:anime_app/core/error/failure.dart';
import 'package:anime_app/features/anime/domain/entities/anime_entity.dart';
import 'package:anime_app/features/anime/domain/usecases/get_anime_details_usecase.dart';
import 'package:anime_app/features/anime/domain/usecases/get_latest_anime_usecase.dart';
import 'package:anime_app/features/anime/domain/usecases/get_popular_anime_usecase.dart';
import 'package:anime_app/features/anime/domain/usecases/get_top_rated_anime_usecase.dart';
import 'package:anime_app/features/anime/presentation/controller/anime_event.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'anime_state.dart';

class AnimeBloc extends Bloc<AnimeEvent, AnimeState> {
  AnimeBloc() : super(AnimeInitial()) {
    on<GetAnimeDetailsEvent>((event, emit) async {
      emit(AnimeLoading());
      final result = await getIt<GetAnimeDetailsUsecase>().call(event.id);
      result.fold(
          (l) => emit(AnimeError(l)), (r) => emit(AnimeDetailsLoaded(r)));
    });

    on<GetLatestAnimeEvent>((event, emit) async {
      emit(AnimeLoading());
      final result = await getIt<GetLatestAnimeUsecase>().call();
      result.fold((l) => emit(AnimeError(l)), (r) => emit(AnimeLoaded(r)));
    });

    on<GetPopularAnimeEvent>((event, emit) async {
      emit(AnimeLoading());
      final result = await getIt<GetPopularAnimeUsecase>().call();
      result.fold((l) => emit(AnimeError(l)), (r) => emit(AnimeLoaded(r)));
    });

    on<GetTopRatedAnimeEvent>((event, emit) async {
      emit(AnimeLoading());
      final result = await getIt<GetTopRatedAnimeUsecase>().call();
      result.fold((l) => emit(AnimeError(l)), (r) => emit(AnimeLoaded(r)));
    });
  }
}
