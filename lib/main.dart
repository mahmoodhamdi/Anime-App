import 'package:anime_app/core/dependency_injection/service_locator.dart';
import 'package:anime_app/features/anime/presentation/views/anime_view.dart';
import 'package:flutter/material.dart';

void main() async {
  await setupServiceLocator();
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
