import 'package:recipes_aplazo/data/models/recipe_local_model.dart';
import 'package:recipes_aplazo/data/models/recipe_model.dart';

/// IMainLocalDataSource is an interface for local data source.
abstract class IMainLocalDatasource {
  /// Fetches a list of [RecipeLocalModel] from the local data source.
  ///
  /// This method is used to retrieve all the recipes stored in the local data source.
  /// Each recipe is represented by a [RecipeLocalModel].
  ///
  /// Returns a [Future] that completes with a list of [RecipeLocalModel].
  /// If there is an error fetching the data, this future will complete with error.
  Future<List<RecipeLocalModel>> recipes();

  /// Saves a [RecipeModel] to the local data source.
  ///
  /// This method is used to store a recipe represented by a [RecipeModel]
  /// into the local data source.
  ///
  /// The [recipe] parameter is required and it represents the recipe to be stored.
  ///
  /// This method returns a [Future] that completes when the recipe is successfully saved.
  /// If there is an error saving the recipe, this future will complete with error.
  Future<void> saveRecipe({required RecipeModel recipe});
}
