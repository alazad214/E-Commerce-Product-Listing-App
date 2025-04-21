import 'dart:developer';

import 'package:ecommerce_product_listing_app/features/home/model/product_model.dart';
import 'package:ecommerce_product_listing_app/features/home/data/product_service.dart';
import 'package:ecommerce_product_listing_app/helpers/db_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productProvider = StateNotifierProvider<ProductNotifier, List<Products>>((
  ref,
) {
  return ProductNotifier();
});

class ProductNotifier extends StateNotifier<List<Products>> {
  ProductNotifier() : super([]);

  final _service = ProductService();
  int _skip = 0;
  final int _limit = 10;
  bool _hasMore = true;
  bool _isLoading = false;

  List<Products> _allProducts = [];

  Future<void> fetchInitialProducts() async {
    final cached = await DBHelper.getProducts();
    if (cached.isNotEmpty) {
      _allProducts = cached;
      state = cached;
    }
    await fetchMoreProducts();
  }

  Future<void> fetchMoreProducts() async {
    if (_isLoading || !_hasMore) return;
    _isLoading = true;

    try {
      final data = await _service.fetchProducts(_skip, _limit);
      _allProducts.addAll(data.products!);
      state = List.from(_allProducts);

      await DBHelper.insertProducts(data.products!);

      _skip += _limit;
      if (data.products!.length < _limit) {
        _hasMore = false;
      }
    } catch (e) {
      log('Error: $e');
    }

    _isLoading = false;
  }

  void searchProducts(String query) {
    if (query.isEmpty) {
      state = List.from(_allProducts);
    } else {
      state =
          _allProducts
              .where(
                (product) =>
                    product.title!.toLowerCase().contains(query.toLowerCase()),
              )
              .toList();
    }
  }

  void sortByLowToHigh() {
  final sorted = [...state]..sort((a, b) => a.price!.compareTo(b.price!));
  state = sorted;
}

void sortByHighToLow() {
  final sorted = [...state]..sort((a, b) => b.price!.compareTo(a.price!));
  state = sorted;
}

void sortByRating() {
  final sorted = [...state]..sort((b, a) => a.rating!.compareTo(b.rating!));
  state = sorted;
}

}
