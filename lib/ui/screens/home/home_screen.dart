import 'package:ecommerce/core/viewmodels/product/product_bloc.dart';
import 'package:ecommerce/ui/widgets/product/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ecommerce"),
      ),
      body: const HomeBodyScreen(),
    );
  }
}

class HomeBodyScreen extends StatefulWidget {
  const HomeBodyScreen({super.key});

  @override
  State<HomeBodyScreen> createState() => _HomeBodyScreenState();
}

class _HomeBodyScreenState extends State<HomeBodyScreen> {
  @override
  void initState() {
    context.read<ProductBloc>().add(const ProductEvent.getProducts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const SizedBox(),
          loaded: (model) {
            return ProductsListWidget(products: model);
          },
        );
      },
    );
  }
}
