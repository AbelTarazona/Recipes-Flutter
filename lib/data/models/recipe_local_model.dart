import 'package:isar/isar.dart';

part 'recipe_local_model.g.dart';

@collection
class RecipeLocalModel {
  Id id = Isar.autoIncrement;
  String? name;
  List<String>? ingredients;
  List<String>? instructions;
  int? prepTimeMinutes;
  String? difficulty;
  String? cuisine;
  String? image;
  int? reviewCount;

  RecipeLocalModel({
    this.name,
    this.ingredients,
    this.instructions,
    this.prepTimeMinutes,
    this.difficulty,
    this.cuisine,
    this.image,
    this.reviewCount,
  });
}
