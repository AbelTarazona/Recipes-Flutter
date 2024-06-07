import 'package:recipes_aplazo/data/models/filter_model.dart';
import 'package:recipes_aplazo/data/models/pagination_model.dart';
import 'package:recipes_aplazo/data/models/pagination_parameters_model.dart';
import 'package:recipes_aplazo/data/models/recipe_local_model.dart';
import 'package:recipes_aplazo/data/models/recipe_model.dart';
import 'package:recipes_aplazo/domain/entities/filter.dart';
import 'package:recipes_aplazo/domain/entities/pagination.dart';
import 'package:recipes_aplazo/domain/entities/pagination_parameters.dart';
import 'package:recipes_aplazo/domain/entities/recipe.dart';

extension PaginationParametersMapper on PaginationParameters {
  PaginationParametersModel toModel() {
    return PaginationParametersModel(
      limit: limit,
      skip: skip,
    );
  }
}

extension FilterMapper on Filter {
  FilterModel toModel() {
    return FilterModel(order: order, sort: sort);
  }
}

extension RecipeModelMapper on RecipeModel {
  Recipe toEntity() {
    return Recipe(
        id: id,
        name: name,
        ingredients: ingredients,
        instructions: instructions,
        prepTimeMinutes: prepTimeMinutes,
        cookTimeMinutes: cookTimeMinutes,
        servings: servings,
        difficulty: difficulty,
        cuisine: cuisine,
        caloriesPerServing: caloriesPerServing,
        tags: tags,
        image: image,
        rating: rating,
        reviewCount: reviewCount,
        mealType: mealType);
  }
}

extension PaginationRecipeModelMapper<T extends RecipeModel>
    on PaginationModel<T> {
  Pagination<Recipe> toEntityPagination() {
    return Pagination<Recipe>(
      total: total,
      skip: skip,
      limit: limit,
      data: data.map((item) => item.toEntity()).toList(),
    );
  }
}

extension RecipeLocalModelMapper on RecipeLocalModel {
  Recipe toEntity() {
    return Recipe(
      id: id,
      name: name ?? '',
      ingredients: ingredients ?? [],
      instructions: instructions ?? [],
      prepTimeMinutes: prepTimeMinutes ?? 0,
      cookTimeMinutes: 0,
      servings: 0,
      difficulty: difficulty ?? '',
      cuisine: cuisine ?? '',
      caloriesPerServing: 0,
      tags: [],
      image: image ?? '',
      rating: 0.0,
      reviewCount: reviewCount ?? 0,
      mealType: [],
    );
  }
}

extension RecipeLocalMapper on Recipe {
  RecipeLocalModel toLocalModel() {
    return RecipeLocalModel(
      name: name,
      ingredients: ingredients,
      instructions: instructions,
      prepTimeMinutes: prepTimeMinutes,
      difficulty: difficulty,
      cuisine: cuisine,
      image: image,
      reviewCount: reviewCount,
    );
  }
}
