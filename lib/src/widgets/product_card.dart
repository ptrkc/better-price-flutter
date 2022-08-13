import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:better_price_flutter/src/shared/models/product_model.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required this.product, required this.units})
      : super(key: key);

  final ProductModel product;
  final List<String> units;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: SizedBox(
            height: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Produto ${product.name}',
                    style: const TextStyle(fontSize: 25)),
                Row(
                  children: [
                    SizedBox(
                      width: 180.0,
                      child: TextField(
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[0-9\.\,]'))
                        ],
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Quantity',
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        for (var unit in units)
                          OutlinedButton(
                            child: Text(unit),
                            onPressed: () {},
                          ),
                      ],
                    ),
                  ],
                ),
                TextField(
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9\.\,]'))
                  ],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Price',
                    prefixText: '\$ ',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
