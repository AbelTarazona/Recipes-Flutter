import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_aplazo/core/bloc/base/base_screen_bloc.dart';
import 'package:recipes_aplazo/core/config/app_colors.dart';
import 'package:recipes_aplazo/domain/entities/recipe.dart';
import 'package:recipes_aplazo/presentation/favorite/bloc/save_favorite_bloc.dart';
import 'package:recipes_aplazo/presentation/favorite/bloc/save_favorite_params.dart';

class Description extends StatelessWidget {
  const Description({super.key, required this.recipe});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Image.asset(
              'assets/images/person.png',
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 10,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Top #20'),
                Text(
                  'Manuel',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
            const Spacer(),
            BlocBuilder<SaveFavoriteBloc, BaseScreenState>(
              builder: (context, state) {
                if (state.status.isLoading) {
                  return const CircularProgressIndicator(color: AppColors.mossGreen,);
                } else if (state.status.isLoaded) {
                  return const Icon(Icons.check, color: AppColors.mossGreen,);
                }
                return InkWell(
                  onTap: () {
                    BlocProvider.of<SaveFavoriteBloc>(context).add(
                      CallAction(params: SaveFavoriteParams(recipe: recipe)),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: AppColors.mossGreen,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.bookmark_border_rounded,
                      color: AppColors.codGray,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam pellentesque turpis non nunc viverra, ac iaculis augue hendrerit. Vivamus quis finibus sapien. Donec nisi lorem, cursus a ex at, sodales ullamcorper erat.',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
