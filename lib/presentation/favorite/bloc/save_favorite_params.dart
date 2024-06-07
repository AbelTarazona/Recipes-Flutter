import 'package:recipes_aplazo/core/bloc/base/screen_params.dart';
import 'package:recipes_aplazo/domain/entities/recipe.dart';

class SaveFavoriteParams extends ScreenParams {
  final Recipe recipe;

  const SaveFavoriteParams({
    required this.recipe,
  });
}
