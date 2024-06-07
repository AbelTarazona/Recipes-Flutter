import 'package:dartz/dartz.dart';
import 'package:recipes_aplazo/core/bloc/base/base_screen_bloc.dart';
import 'package:recipes_aplazo/core/bloc/base/screen_params.dart';
import 'package:recipes_aplazo/domain/failures/failure.dart';
import 'package:recipes_aplazo/domain/repositories/i_main_repository.dart';
import 'package:recipes_aplazo/presentation/favorite/bloc/save_favorite_params.dart';

class SaveFavoriteBloc extends BaseScreenBloc<void> {
  final IMainRepository repository;

  SaveFavoriteBloc({required super.hasConnection, required this.repository});

  @override
  Future<Either<Failure, void>> repositoryCall(ScreenParams params) {
    final p = params as SaveFavoriteParams;
    return repository.saveRecipe(recipe: p.recipe);
  }
}
