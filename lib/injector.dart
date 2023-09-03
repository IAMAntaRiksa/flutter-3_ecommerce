import 'package:ecommerce/core/data/api.dart';
import 'package:ecommerce/core/data/base_api.dart';
import 'package:ecommerce/core/services/product_service.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<Api>(Api());
  locator.registerLazySingleton(() => BaseApi());
  locator.registerLazySingleton(() => ProductService(locator<BaseApi>()));
}
