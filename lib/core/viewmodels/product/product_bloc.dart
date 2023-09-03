import 'package:bloc/bloc.dart';
import 'package:ecommerce/core/models/product/product_model.dart';
import 'package:ecommerce/core/services/product_service.dart';
import 'package:ecommerce/injector.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_event.dart';
part 'product_state.dart';
part 'product_bloc.freezed.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final productService = locator<ProductService>();
  ProductBloc() : super(const _Initial()) {
    on<_GetProducts>((event, emit) async {
      emit(const _Loading());
      final result = await productService.getRestaurants();

      if (result.error == false) {
        return emit(_Loaded(result.data!));
      } else {
        return emit(const _Error("Get Item Product Error"));
      }
    });
  }
}
