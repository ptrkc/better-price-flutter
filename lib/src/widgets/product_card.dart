import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:better_price_flutter/src/shared/models/product_model.dart';
import 'package:better_price_flutter/src/volume/volume_controller.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    required Key key,
    required this.product,
    required this.units,
  }) : super(key: key);

  final ProductModel product;
  final List<String> units;

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<VolumeController>();

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
                Row(
                  children: [
                    SizedBox(
                      width: 180.0,
                      child: TextField(
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Product ${product.id}',
                        ),
                      ),
                    ),
                    OutlinedButton(
                      child: Text('Delete ${product.id}'),
                      onPressed: () => controller.removeById(product.id),
                    ),
                  ],
                ),
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
