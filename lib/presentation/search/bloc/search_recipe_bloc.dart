import 'package:dartz/dartz.dart';
import 'package:recipes_aplazo/core/bloc/base/screen_params.dart';
import 'package:recipes_aplazo/core/bloc/pagination/pagination_bloc.dart';
import 'package:recipes_aplazo/core/utils/search_global.dart';
import 'package:recipes_aplazo/domain/entities/pagination.dart';
import 'package:recipes_aplazo/domain/entities/pagination_parameters.dart';
import 'package:recipes_aplazo/domain/entities/recipe.dart';
import 'package:recipes_aplazo/domain/failures/failure.dart';
import 'package:recipes_aplazo/domain/repositories/i_main_repository.dart';

class SearchRecipeBloc extends PaginationBloc<Recipe> {
  final IMainRepository repository;

  SearchRecipeBloc({required super.hasConnection, required this.repository});

  @override
  Future<Either<Failure, Pagination<Recipe>>> repositoryCall(ScreenParams params) {
    final paginationParameters = PaginationParameters(limit: pageSize, skip: page);
    String? search = SearchGlobal.instance.search;
    return repository.searchRecipe(parameters: paginationParameters, query: search ?? '');
  }
}
