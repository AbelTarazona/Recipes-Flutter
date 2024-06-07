import 'package:flutter/material.dart';
import 'package:recipes_aplazo/core/config/app_colors.dart';
import 'package:recipes_aplazo/domain/entities/recipe.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.recipe});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 20,
        ),
        Text(
          recipe.name,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: AppColors.codGray,
          ),
        ),
        Text(
          'Reviews by ${recipe.reviewCount} people',
          textAlign: TextAlign.center,
          style: const TextStyle(color: AppColors.dawn, fontSize: 16),
        ),
        const SizedBox(
          height: 20,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Hero(
            tag: 'hero-${recipe.id}',
            child: Image.network(
              recipe.image,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
