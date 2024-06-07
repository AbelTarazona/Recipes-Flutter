import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_aplazo/core/bloc/base/base_screen_bloc.dart';
import 'package:recipes_aplazo/core/config/app_colors.dart';
import 'package:recipes_aplazo/core/widgets/animated_grid_widget.dart';
import 'package:recipes_aplazo/core/widgets/empty_state.dart';
import 'package:recipes_aplazo/domain/entities/recipe.dart';
import 'package:recipes_aplazo/presentation/favorite/bloc/favorite_bloc.dart';
import 'package:recipes_aplazo/presentation/home/widgets/recipe_card.dart';

class FavoriteList extends StatelessWidget {
  const FavoriteList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, BaseScreenState<List<Recipe>>>(
      builder: (context, state) {
        final items = state.value ?? [];
        final showLoader = state.status.isLoading;

        return Expanded(
          child: AnimatedGridWidget<Recipe>(
            mainAxisExtent: 180,
            isLoading: showLoader,
            items: items,
            isError: state.status.isError,
            physics: const BouncingScrollPhysics(),
            loadingWidget: const CircularProgressIndicator(
              color: AppColors.codGray,
            ),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            emptyWidget: const EmptyState(message: 'No favorite recipes yet'),
            itemBuilder: (item) {
              return RecipeCard(recipe: item);
            },
          ),
        );
      },
    );
  }
}
