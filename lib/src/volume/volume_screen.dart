import 'package:flutter/material.dart';
import 'package:better_price_flutter/src/widgets/product_card.dart';

class VolumeScreen extends StatelessWidget {
  const VolumeScreen({Key? key}) : super(key: key);

  final List<String> products = const ['prod1', 'prod2'];
  final List<String> units = const ['ml', 'l'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Volume'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductCard(product: product, units: units);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
