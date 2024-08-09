import 'package:anime_app/anime_app.dart';
import 'package:anime_app/core/dependency_injection/service_locator.dart';
import 'package:anime_app/features/anime/presentation/views/anime_details.dart';
import 'package:flutter/material.dart';

void main() async {
  await setupServiceLocator();
  runApp(const AnimeApp());
}
