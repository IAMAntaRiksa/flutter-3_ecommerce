import 'package:ecommerce/core/data/base_api.dart';
import 'package:ecommerce/core/models/api/api_response.dart';
import 'package:ecommerce/core/models/api/api_result_model.dart';
import 'package:ecommerce/core/models/product/product_model.dart';

class ProductService {
  BaseApi api;

  ProductService(this.api);

  Future<ApiResultList<ProductModel>> getRestaurants() async {
    APIResponse response = await api.get(
      api.endpoint.getProducts,
      useToken: false,
    );
    return ApiResultList<ProductModel>.fromJson(
      response.data,
      (i) => i.map((e) => ProductModel.fromJson(e)).toList(),
      "data",
    );
  }
}
