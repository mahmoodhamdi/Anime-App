import 'package:anime_app/core/dependency_injection/service_locator.dart';
import 'package:anime_app/features/anime/presentation/views/anime_view.dart';
import 'package:anime_app/features/characters/data/data_sources/character_remote_data_source.dart';
import 'package:anime_app/features/characters/data/repository_impl/character_repository_impl.dart';
import 'package:anime_app/features/characters/domain/usecases/get_character_by_id_usecase.dart';
import 'package:anime_app/features/characters/domain/usecases/get_characters_list_usecase.dart';
import 'package:anime_app/features/characters/domain/usecases/get_media_characters_list_usecase.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() async {
  await setupServiceLocator();
  //get character by id

  var character = await GetCharacterByIdUsecase(
          characterRepository: CharacterRepositoryImpl(
              characterRemoteDataSource:
                  CharacterRemoteDataSourceImpl(dio: Dio())))
      .call(id: "7520");
  character.fold((l) => print(l.errorMessage), (r) => print(r.name));
 // mediaCharacters
 
  var mediaCharacters = await GetMediaCharactersListUsecase(
          characterRepository: CharacterRepositoryImpl(
              characterRemoteDataSource:
                  CharacterRemoteDataSourceImpl(dio: Dio())))
      .call(id: "7442", page: 1);
  mediaCharacters.fold((l) => print(l.errorMessage), (r) => print(r.first.id));

// get characters list by animeId

var characters = await GetCharactersListUsecase(
        characterRepository: CharacterRepositoryImpl(
            characterRemoteDataSource:
                CharacterRemoteDataSourceImpl(dio: Dio())))
    .call(animeId: "7442",page: 1);
  characters.fold((l) => print(l.errorMessage), (r) => print(r.first.name));


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Anime App',
      home: AnimeView(),
    );
  }
}
