import 'package:flutter/material.dart';
import 'package:recipes_aplazo/core/config/app_colors.dart';
import 'package:recipes_aplazo/domain/entities/recipe.dart';
import 'package:recipes_aplazo/presentation/detail/detail_page.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({super.key, required this.recipe});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(DetailPage.route(recipe: recipe));
      },
      child: Column(
        children: [
          Image.network(
            recipe.image,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            recipe.cuisine,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.w300, height: 1.2),
          ),
          Text(
            recipe.name,
            textAlign: TextAlign.center,
            maxLines: 1,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.access_alarm_rounded,
                size: 15,
                color: AppColors.dawn,
              ),
              const SizedBox(width: 5),
              Text(
                '${recipe.prepTimeMinutes} min',
                style: const TextStyle(
                  color: AppColors.dawn,
                ),
              ),
              const SizedBox(width: 5),
              Container(
                height: 10,
                width: 1,
                color: AppColors.dawn,
              ),
              const SizedBox(width: 5),
              const Icon(
                Icons.shopping_basket_outlined,
                size: 15,
                color: AppColors.dawn,
              ),
              const SizedBox(width: 5),
              Text(
                '${recipe.ingredients.length} items',
                style: const TextStyle(
                  color: AppColors.dawn,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
