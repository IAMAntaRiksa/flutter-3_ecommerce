import 'package:ecommerce/core/models/product/product_model.dart';
import 'package:ecommerce/ui/widgets/product/prodoct_item_dart.dart';
import 'package:flutter/material.dart';

class ProductsListWidget extends StatelessWidget {
  final List<ProductModel> products;
  final bool useHero;
  final bool useReplacement;
  const ProductsListWidget({
    super.key,
    required this.products,
    this.useHero = true,
    this.useReplacement = false,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: products.length,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      itemBuilder: (context, index) {
        final ProductModel product = products[index];
        return ProductItem(
          product: product,
          userHero: useHero,
          onClick: () {},
          // onClick: () => useReplacement
          //     ? context.push("${DetailProdcutScreen.routeName}/${product.id}")
          //     : context.push("${DetailProdcutScreen.routeName}/${product.id}"),
        );
      },
    );
  }
}
