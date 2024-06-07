import 'package:flutter/material.dart';
import 'package:recipes_aplazo/core/config/app_colors.dart';
import 'package:recipes_aplazo/domain/entities/recipe.dart';
import 'package:recipes_aplazo/presentation/detail/widgets/information_pill.dart';

class Information extends StatelessWidget {
  const Information({super.key, required this.recipe});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          color: AppColors.codGray,
        ),
        const SizedBox(
          height: 10,
        ),
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InformationPill(
                  title: 'Ingredients',
                  detail: '${recipe.ingredients.length} items',
                  icon: Icons.shopping_basket_outlined),
              const VerticalDivider(color: AppColors.codGray),
              InformationPill(
                  title: 'Time',
                  detail: '${recipe.prepTimeMinutes} min',
                  icon: Icons.access_alarm_rounded),
              const VerticalDivider(color: AppColors.codGray),
              InformationPill(
                  title: 'Level',
                  detail: recipe.difficulty,
                  icon: Icons.account_tree_outlined),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          color: AppColors.codGray,
        ),
      ],
    );
  }
}
