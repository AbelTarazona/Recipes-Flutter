import 'package:dartz/dartz.dart';
import 'package:recipes_aplazo/domain/entities/filter.dart';
import 'package:recipes_aplazo/domain/entities/pagination.dart';
import 'package:recipes_aplazo/domain/entities/pagination_parameters.dart';
import 'package:recipes_aplazo/domain/entities/recipe.dart';
import 'package:recipes_aplazo/domain/failures/failure.dart';

abstract class IMainRepository {
  Future<Either<Failure, Pagination<Recipe>>> recipes({
    required PaginationParameters parameters,
    Filter? filter,
  });

  Future<Either<Failure, Pagination<Recipe>>> searchRecipe({
    required PaginationParameters parameters,
    Filter? filter,
    required String query,
  });
}
