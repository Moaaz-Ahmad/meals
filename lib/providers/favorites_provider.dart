import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavoritesMealsNotifier extends StateNotifier<List<Meal>> {
  FavoritesMealsNotifier() : super([]);

  bool toggleFavorite(Meal meal) {
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      state = List.from(state)..remove(meal);
      return false;
    } else {
      state = List.from(state)..add(meal);
      return true;
    }
  }
}

final favoriteMealsProvider = StateNotifierProvider<FavoritesMealsNotifier,List<Meal>>((ref) {
  return FavoritesMealsNotifier();
});
