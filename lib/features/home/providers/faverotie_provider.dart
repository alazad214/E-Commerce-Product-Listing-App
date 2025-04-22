import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoriteProvider =
    StateNotifierProvider<FavoriteNotifier, Map<int, bool>>(
      (ref) => FavoriteNotifier(),
    );

class FavoriteNotifier extends StateNotifier<Map<int, bool>> {
  FavoriteNotifier() : super({});

  void toggleFavorite(int productId) {
    state = {...state, productId: !(state[productId] ?? false)};
  }

  bool isFavorite(int productId) {
    return state[productId] ?? false;
  }
}
