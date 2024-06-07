import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_aplazo/core/bloc/base/base_screen_bloc.dart';
import 'package:recipes_aplazo/core/bloc/pagination/pagination_params.dart';
import 'package:recipes_aplazo/core/config/app_colors.dart';
import 'package:recipes_aplazo/core/utils/search_global.dart';
import 'package:recipes_aplazo/presentation/home/bloc/recipe_bloc.dart';
import 'package:recipes_aplazo/presentation/search/bloc/search_recipe_bloc.dart';

class Searcher extends StatelessWidget {
  Searcher({super.key});

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: AppColors.codGray),
      ),
      child: Row(
        children: [
          const Icon(Icons.search_rounded),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              autofocus: true,
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'Search for recipes...',
                border: InputBorder.none,
              ),
              style: const TextStyle(
                color: AppColors.codGray,
              ),
              cursorColor: AppColors.codGray,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.search,
              onSubmitted: (value) {
                fetchRecipes(value, context);
              },
            ),
          ),
        ],
      ),
    );
  }

  void fetchRecipes(String value, BuildContext context) {
    SearchGlobal.instance.setSearch(value);
    BlocProvider.of<SearchRecipeBloc>(context).add(
      const CallAction(params: ScreenPaginationParams(clearData: true)),
    );
  }
}
