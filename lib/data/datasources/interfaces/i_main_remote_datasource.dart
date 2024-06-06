import 'package:recipes_aplazo/data/models/filter_model.dart';
import 'package:recipes_aplazo/data/models/pagination_model.dart';
import 'package:recipes_aplazo/data/models/pagination_parameters_model.dart';
import 'package:recipes_aplazo/data/models/recipe_model.dart';

/// Interface for the main remote datasource
abstract class IMainRemoteDatasource {
  /// Fetches a paginated list of [RecipeModel] from the remote data source.
  ///
  /// The [parameters] argument is required and it specifies the pagination parameters.
  /// It is an instance of [PaginationParametersModel] which contains the limit and skip values for pagination.
  ///
  /// The [filter] argument is optional and it can be used to apply specific filters to the recipes.
  /// It is an instance of [FilterModel].
  ///
  /// This method returns a [Future] that completes with a [PaginationModel] of [RecipeModel].
  /// [PaginationModel] contains the total number of recipes, the number of skipped recipes, the limit for the number of recipes per page, and the actual data (recipes).
  ///
  /// Throws an exception if there is a network error or if any error occurs during the process.
  Future<PaginationModel<RecipeModel>> recipes({
    required PaginationParametersModel parameters,
    FilterModel? filter,
  });

  /// Fetches a paginated list of [RecipeModel] from the remote data source based on a search query.
  ///
  /// The [parameters] argument is required and it specifies the pagination parameters.
  /// It is an instance of [PaginationParametersModel] which contains the limit and skip values for pagination.
  ///
  /// The [filter] argument is optional and it can be used to apply specific filters to the recipes.
  /// It is an instance of [FilterModel].
  ///
  /// The [query] argument is required and it is used to search for specific recipes.
  ///
  /// This method returns a [Future] that completes with a [PaginationModel] of [RecipeModel].
  /// [PaginationModel] contains the total number of recipes, the number of skipped recipes, the limit for the number of recipes per page, and the actual data (recipes).
  ///
  /// Throws an exception if there is a network error or if any error occurs during the process.
  Future<PaginationModel<RecipeModel>> searchRecipe({
    required PaginationParametersModel parameters,
    FilterModel? filter,
    required String query,
  });
}
