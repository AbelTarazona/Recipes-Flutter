import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:recipes_aplazo/core/bloc/bloc_observer.dart';
import 'package:recipes_aplazo/core/di_core.dart';
import 'package:recipes_aplazo/presentation/home/home_page.dart';

void main() {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };
  setupDiCore();
  Bloc.observer = const AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
      navigatorObservers: [ChuckerFlutter.navigatorObserver],
    );
  }
}
