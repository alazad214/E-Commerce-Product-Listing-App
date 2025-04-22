import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoriteProvider =
    StateNotifierProvider<FavoriteNotifier, Map<String, bool>>(
  (ref) => FavoriteNotifier(),
);

class FavoriteNotifier extends StateNotifier<Map<String, bool>> {
  FavoriteNotifier() : super({});

  void toggleFavorite(String productId) {
    state = {...state, productId: !(state[productId] ?? false)};
  }

  bool isFavorite(String productId) {
    return state[productId] ?? false;
  }
}
