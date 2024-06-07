import 'package:dartz/dartz.dart';
import 'package:recipes_aplazo/data/datasources/interfaces/i_main_local_datasource.dart';
import 'package:recipes_aplazo/data/datasources/interfaces/i_main_remote_datasource.dart';
import 'package:recipes_aplazo/data/exceptions/general_exception.dart';
import 'package:recipes_aplazo/data/mappers/main_mapper.dart';
import 'package:recipes_aplazo/domain/entities/filter.dart';
import 'package:recipes_aplazo/domain/entities/pagination.dart';
import 'package:recipes_aplazo/domain/entities/pagination_parameters.dart';
import 'package:recipes_aplazo/domain/entities/recipe.dart';
import 'package:recipes_aplazo/domain/failures/failure.dart';
import 'package:recipes_aplazo/domain/repositories/i_main_repository.dart';

class MainRepository implements IMainRepository {
  final IMainRemoteDatasource mainRemoteDatasource;
  final IMainLocalDatasource mainLocalDatasource;

  MainRepository({
    required this.mainRemoteDatasource,
    required this.mainLocalDatasource,
  });

  @override
  Future<Either<Failure, Pagination<Recipe>>> recipes(
      {required PaginationParameters parameters, Filter? filter}) async {
    try {
      final data = await mainRemoteDatasource.recipes(
        parameters: parameters.toModel(),
        filter: filter?.toModel(),
      );
      return Right(data.toEntityPagination());
    } on GeneralException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, Pagination<Recipe>>> searchRecipe({
    required PaginationParameters parameters,
    Filter? filter,
    required String query,
  }) async {
    try {
      final data = await mainRemoteDatasource.searchRecipe(
        parameters: parameters.toModel(),
        filter: filter?.toModel(),
        query: query,
      );
      return Right(data.toEntityPagination());
    } on GeneralException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Recipe>>> localRecipes() async {
    try {
      final data = await mainLocalDatasource.recipes();
      return Right(data.map((item) => item.toEntity()).toList());
    } on GeneralException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> saveRecipe({required Recipe recipe}) async {
    try {
      await mainLocalDatasource.saveRecipe(recipe: recipe.toLocalModel());
      return const Right(null);
    } on GeneralException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
