import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_aplazo/core/bloc/base/base_screen_bloc.dart';
import 'package:recipes_aplazo/core/bloc/pagination/pagination_params.dart';
import 'package:recipes_aplazo/core/config/app_colors.dart';
import 'package:recipes_aplazo/core/di_core.dart';
import 'package:recipes_aplazo/presentation/home/bloc/recipe_bloc.dart';
import 'package:recipes_aplazo/presentation/home/widgets/header.dart';
import 'package:recipes_aplazo/presentation/home/widgets/recipe_list.dart';
import 'package:recipes_aplazo/presentation/home/widgets/searcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecipeBloc(
        hasConnection: getIt(),
        repository: getIt(),
      ),
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatefulWidget {
  const _HomeView();

  @override
  State<_HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<_HomeView> {
  @override
  void initState() {
    super.initState();
    fetchRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bianca,
      appBar: AppBar(
        backgroundColor: AppColors.bianca,
        leading: IconButton(
          icon: const Icon(Icons.rice_bowl),
          onPressed: () {
            ChuckerFlutter.showChuckerScreen();
          },
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Header(),
            SizedBox(height: 20),
            Searcher(),
            SizedBox(height: 30),
            RecipeList()
          ],
        ),
      ),
    );
  }

  void fetchRecipes() {
    BlocProvider.of<RecipeBloc>(context).add(
      const CallAction(params: ScreenPaginationParams(clearData: true)),
    );
  }
}
