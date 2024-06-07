import 'package:dartz/dartz.dart';
import 'package:recipes_aplazo/core/bloc/base/base_screen_bloc.dart';
import 'package:recipes_aplazo/core/bloc/base/screen_params.dart';
import 'package:recipes_aplazo/domain/entities/recipe.dart';
import 'package:recipes_aplazo/domain/failures/failure.dart';
import 'package:recipes_aplazo/domain/repositories/i_main_repository.dart';

class FavoriteBloc extends BaseScreenBloc<List<Recipe>> {
  final IMainRepository repository;

  FavoriteBloc({required super.hasConnection, required this.repository});

  @override
  Future<Either<Failure, List<Recipe>>> repositoryCall(ScreenParams params) {
    return repository.localRecipes();
  }
}
