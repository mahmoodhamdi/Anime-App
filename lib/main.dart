import 'package:anime_app/anime_app.dart';
import 'package:anime_app/core/dependency_injection/service_locator.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  runApp(const AnimeApp());
}
