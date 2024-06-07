import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes_aplazo/core/config/app_colors.dart';
import 'package:recipes_aplazo/core/di_core.dart';
import 'package:recipes_aplazo/presentation/search/bloc/search_recipe_bloc.dart';
import 'package:recipes_aplazo/presentation/search/widgets/search_list.dart';
import 'package:recipes_aplazo/presentation/search/widgets/searcher.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  static Route<void> route() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => BlocProvider(
        create: (context) => SearchRecipeBloc(
          hasConnection: getIt(),
          repository: getIt(),
        ),
        child: SearchPage(),
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bianca,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Searcher(),
              const SizedBox(height: 20),
              SearchList()
            ],
          ),
        ),
      ),
    );
  }
}
