import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:better_price_flutter/src/volume/volume_controller.dart';
import 'package:better_price_flutter/src/widgets/product_card.dart';

class VolumeScreen extends StatelessWidget {
  const VolumeScreen({Key? key}) : super(key: key);

  final List<String> units = const ['ml', 'l'];

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<VolumeController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Volume'),
      ),
      body: ListView.builder(
        itemCount: controller.products.length,
        itemBuilder: (context, index) {
          final product = controller.products[index];
          return ProductCard(product: product, units: units);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.add();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
