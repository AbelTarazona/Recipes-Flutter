import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:recipes_aplazo/data/datasources/interfaces/i_main_local_datasource.dart';
import 'package:recipes_aplazo/data/exceptions/general_exception.dart';
import 'package:recipes_aplazo/data/models/recipe_local_model.dart';
import 'package:recipes_aplazo/data/models/recipe_model.dart';

class MainLocalDatasource implements IMainLocalDatasource {
  late Isar _isar;

  MainLocalDatasource() {
    _initializeIsar();
  }

  Future<void> _initializeIsar() async {
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open([RecipeLocalModelSchema], directory: dir.path);
  }

  @override
  Future<List<RecipeLocalModel>> recipes() async {
    try {
      final recipes =
          await _isar.collection<RecipeLocalModel>().where().findAll();
      return recipes;
    } catch (e) {
      throw GeneralException('Error al obtener recetas: $e');
    }
  }

  @override
  Future<void> saveRecipe({required RecipeLocalModel recipe}) async {
    try {
      final existingRecipe = await _isar.recipeLocalModels
          .filter()
          .nameEqualTo(recipe.name)
          .findFirst();
      if (existingRecipe == null) {
        await _isar.writeTxn(() async {
          await _isar.recipeLocalModels.put(recipe);
        });
      }
    } catch (e) {
      throw GeneralException('Error al guardar receta: $e');
    }
  }
}
