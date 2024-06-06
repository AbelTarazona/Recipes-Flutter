import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_aplazo/core/bloc/base/base_screen_bloc.dart';
import 'package:recipes_aplazo/core/bloc/pagination/pagination_params.dart';
import 'package:recipes_aplazo/core/di_core.dart';
import 'package:recipes_aplazo/domain/entities/pagination.dart';
import 'package:recipes_aplazo/domain/entities/recipe.dart';
import 'package:recipes_aplazo/presentation/home/bloc/recipe_bloc.dart';

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
      appBar: AppBar(
        title: const Text('Recipes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.document_scanner),
            onPressed: () {
              ChuckerFlutter.showChuckerScreen();
            },
          ),
        ],
      ),
      body: BlocBuilder<RecipeBloc, BaseScreenState<Pagination<Recipe>>>(
        builder: (context, state) {
          if (state.status.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.status.isError) {
            return Center(
              child: Text(state.message),
            );
          }
          if (state.value == null) {
            return const Center(
              child: Text('No data'),
            );
          }
          return ListView.builder(
            itemCount: state.value!.data.length,
            itemBuilder: (context, index) {
              final recipe = state.value!.data[index];
              return ListTile(
                title: Text(recipe.name),
                subtitle: Text(recipe.difficulty),
              );
            },
          );
        },
      ),
    );
  }

  void fetchRecipes() {
    BlocProvider.of<RecipeBloc>(context).add(
      const CallAction(params: ScreenPaginationParams(clearData: true)),
    );
  }
}
