import 'package:flutter/material.dart';
import 'package:recipes_aplazo/core/config/app_colors.dart';
import 'package:recipes_aplazo/domain/entities/recipe.dart';
import 'package:recipes_aplazo/presentation/detail/widgets/content.dart';
import 'package:recipes_aplazo/presentation/detail/widgets/description.dart';
import 'package:recipes_aplazo/presentation/detail/widgets/header.dart';
import 'package:recipes_aplazo/presentation/detail/widgets/information.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.recipe});

  final Recipe recipe;

  static Route<void> route({required Recipe recipe}) {
    return MaterialPageRoute(
      builder: (_) => DetailPage(recipe: recipe),
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
                const SizedBox(height: 20,),
                Description(recipe: recipe),
                const SizedBox(height: 20,),
                Information(recipe: recipe),
                const SizedBox(height: 20,),
                Content(recipe: recipe,),
                const SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
