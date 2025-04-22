import 'package:dio/dio.dart';
import 'package:ecommerce_product_listing_app/core/networks/endpoinds.dart';
import 'package:ecommerce_product_listing_app/features/home/model/product_model.dart';

class ProductService {
  final Dio _dio = Dio();

  Future<ProductModel> fetchProducts(int skip, int limit) async {
    final response = await _dio.get(
      '$baseUrl${Endpoints.products()}',
      queryParameters: {'skip': skip, 'limit': limit},
    );
    return ProductModel.fromJson(response.data);
  }
}
