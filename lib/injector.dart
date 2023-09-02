import 'package:ecommerce/core/data/api.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton(() => Api());
}
