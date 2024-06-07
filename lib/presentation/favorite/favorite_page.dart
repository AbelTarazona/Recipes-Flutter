import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_aplazo/core/bloc/base/base_screen_bloc.dart';
import 'package:recipes_aplazo/core/config/app_colors.dart';
import 'package:recipes_aplazo/core/di_core.dart';
import 'package:recipes_aplazo/presentation/favorite/bloc/favorite_bloc.dart';
import 'package:recipes_aplazo/presentation/favorite/widgets/favorite_list.dart';
import 'package:recipes_aplazo/presentation/favorite/widgets/header.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (_) => BlocProvider(
          create: (context) => FavoriteBloc(
                hasConnection: getIt(),
                repository: getIt(),
              )..add(const CallAction()),
          child: const FavoritePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.bianca,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Header(),
              const SizedBox(height: 20),
              FavoriteList(),
            ],
          ),
        ),
      ),
    );
  }
}
