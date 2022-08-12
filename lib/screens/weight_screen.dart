import 'package:flutter/material.dart';
import '../widgets/product_card.dart';

class WeightScreen extends StatefulWidget {
  const WeightScreen({Key? key}) : super(key: key);

  @override
  State<WeightScreen> createState() => WeightState();
}

class WeightState extends State<WeightScreen> {
  List<String> products = ['prod1', 'prod2'];
  List<String> units = ['g', 'kg'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weight'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductCard(product: product, units: units);
        },
      ),
    );
  }
}
