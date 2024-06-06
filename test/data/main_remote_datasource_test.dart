import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:recipes_aplazo/data/datasources/main_remote_datasource.dart';
import 'package:recipes_aplazo/data/models/pagination_model.dart';
import 'package:recipes_aplazo/data/models/pagination_parameters_model.dart';
import 'package:recipes_aplazo/data/models/recipe_model.dart';
import 'package:recipes_aplazo/data/services/api_service.dart';

import 'main_remote_datasource_test.mocks.dart';

@GenerateMocks([ApiService])
void main() {
  late MainRemoteDatasource datasource;
  late MockApiService mockApiService;

  setUp(() {
    mockApiService = MockApiService();
    datasource = MainRemoteDatasource(apiService: mockApiService);
  });

  group('MainRemoteDatasource', () {
    var jsonExample = {
      "recipes": [
        {
          "id": 1,
          "name": "Classic Margherita Pizza",
          "ingredients": [
            "Pizza dough",
            "Tomato sauce",
            "Fresh mozzarella cheese",
            "Fresh basil leaves",
            "Olive oil",
            "Salt and pepper to taste"
          ],
          "instructions": [
            "Preheat the oven to 475°F (245°C).",
            "Roll out the pizza dough and spread tomato sauce evenly.",
            "Top with slices of fresh mozzarella and fresh basil leaves.",
            "Drizzle with olive oil and season with salt and pepper.",
            "Bake in the preheated oven for 12-15 minutes or until the crust is golden brown.",
            "Slice and serve hot."
          ],
          "prepTimeMinutes": 20,
          "cookTimeMinutes": 15,
          "servings": 4,
          "difficulty": "Easy",
          "cuisine": "Italian",
          "caloriesPerServing": 300,
          "tags": ["Pizza", "Italian"],
          "userId": 166,
          "image": "https://cdn.dummyjson.com/recipe-images/1.webp",
          "rating": 4.6,
          "reviewCount": 98,
          "mealType": ["Dinner"]
        }
      ],
      "total": 50,
      "skip": 0,
      "limit": 1
    };

    test('returns a PaginationModel when recipes is called', () async {
      // Define the behavior of the mock ApiService
      when(mockApiService.get(endpoint: 'recipes?limit=10&skip=0'))
          .thenAnswer((_) async => jsonExample);

      // Call the method and verify the result
      final result = await datasource.recipes(
          parameters: PaginationParametersModel(limit: 10, skip: 0));
      expect(result, isInstanceOf<PaginationModel<RecipeModel>>());
    });

    test('returns a PaginationModel when searchRecipe is called', () async {
      // Define the behavior of the mock ApiService
      when(mockApiService.get(endpoint: 'recipes/search?limit=10&skip=0&q=query'))
          .thenAnswer((_) async => jsonExample);

      // Call the method and verify the result
      final result = await datasource.searchRecipe(
          parameters: PaginationParametersModel(limit: 10, skip: 0),
          query: 'query');
      expect(result, isInstanceOf<PaginationModel<RecipeModel>>());
    });
  });
}
