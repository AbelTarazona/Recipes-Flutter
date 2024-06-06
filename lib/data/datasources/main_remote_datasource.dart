import 'package:recipes_aplazo/data/datasources/interfaces/i_main_remote_datasource.dart';
import 'package:recipes_aplazo/data/exceptions/api_exception.dart';
import 'package:recipes_aplazo/data/exceptions/general_exception.dart';
import 'package:recipes_aplazo/data/models/filter_model.dart';
import 'package:recipes_aplazo/data/models/pagination_model.dart';
import 'package:recipes_aplazo/data/models/pagination_parameters_model.dart';
import 'package:recipes_aplazo/data/models/recipe_model.dart';
import 'package:recipes_aplazo/data/services/api_service.dart';

class MainRemoteDatasource implements IMainRemoteDatasource {
  final ApiService apiService;

  MainRemoteDatasource({required this.apiService});

  @override
  Future<PaginationModel<RecipeModel>> recipes({
    required PaginationParametersModel parameters,
    FilterModel? filter,
  }) async {
    try {
      final response = await apiService.get(endpoint: 'recipes');
      PaginationModel<RecipeModel> itemModel =
          PaginationModel<RecipeModel>.fromJson(response, RecipeModel.fromJson);
      return itemModel;
    } on ApiException catch (e) {
      throw GeneralException(e.detail);
    } catch (e) {
      throw GeneralException('Error al obtener recetas: $e');
    }
  }

  @override
  Future<PaginationModel<RecipeModel>> searchRecipe({
    required PaginationParametersModel parameters,
    FilterModel? filter,
    required String query,
  }) async {
    try {
      final response =
          await apiService.get(endpoint: 'recipes/search?q=$query');
      PaginationModel<RecipeModel> itemModel =
          PaginationModel<RecipeModel>.fromJson(response, RecipeModel.fromJson);
      return itemModel;
    } on ApiException catch (e) {
      throw GeneralException(e.detail);
    } catch (e) {
      throw GeneralException('Error al obtener recetas: $e');
    }
  }
}
