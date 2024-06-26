import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_aplazo/core/config/app_colors.dart';
import 'package:recipes_aplazo/core/di_core.dart';
import 'package:recipes_aplazo/domain/entities/recipe.dart';
import 'package:recipes_aplazo/presentation/detail/widgets/content.dart';
import 'package:recipes_aplazo/presentation/detail/widgets/description.dart';
import 'package:recipes_aplazo/presentation/detail/widgets/header.dart';
import 'package:recipes_aplazo/presentation/detail/widgets/information.dart';
import 'package:recipes_aplazo/presentation/favorite/bloc/save_favorite_bloc.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.recipe});

  final Recipe recipe;

  static Route<void> route({required Recipe recipe}) {
    return MaterialPageRoute(
      builder: (_) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SaveFavoriteBloc(
              hasConnection: getIt(),
              repository: getIt(),
            ),
          ),
        ],
        child: DetailPage(recipe: recipe),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bianca,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Header(recipe: recipe),
                const SizedBox(
                  height: 20,
                ),
                Description(recipe: recipe),
                const SizedBox(
                  height: 20,
                ),
                Information(recipe: recipe),
                const SizedBox(
                  height: 20,
                ),
                Content(
                  recipe: recipe,
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
