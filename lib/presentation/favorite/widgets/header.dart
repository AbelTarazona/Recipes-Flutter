import 'package:flutter/material.dart';
import 'package:recipes_aplazo/core/config/app_colors.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 20),
        Text(
          'My Favorite Recipes',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: AppColors.codGray,
          ),
        ),
      ],
    );
  }
}
