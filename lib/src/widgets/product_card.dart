import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:better_price_flutter/src/shared/models/product_model.dart';
import 'package:better_price_flutter/src/volume/volume_controller.dart';
import 'package:better_price_flutter/src/widgets/controlled_text_field.dart';

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
                      child: ControlledTextField(
                        text: product.name.toString(),
                        onChanged: (value) =>
                            controller.setNameById(product.id, value),
                        decoration: InputDecoration(
                          isDense: true,
                          border: const OutlineInputBorder(),
                          labelText: 'Product ${product.id}',
                        ),
                      ),
                    ),
                    OutlinedButton(
                      child: const Text('Delete'),
                      onPressed: () => controller.removeById(product.id),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 180.0,
                      child: ControlledTextField(
                        text: product.quantity.toString(),
                        onChanged: (value) =>
                            controller.setQuantityById(product.id, value),
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[0-9\.\,]'))
                        ],
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Quantity*',
                          isDense: true,
                        ),
                      ),
                    ),
                    ToggleButtons(
                      isSelected:
                          units.map((unit) => product.unit == unit).toList(),
                      children: units.map((unit) => Text(unit)).toList(),
                      onPressed: (int index) =>
                          controller.setUnitById(product.id, units[index]),
                    )
                  ],
                ),
                ControlledTextField(
                  text: product.price.toString(),
                  onChanged: (value) =>
                      controller.setPriceById(product.id, value),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9\.\,]'))
                  ],
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Price*',
                    prefixText: '\$ ',
                    isDense: true,
                  ),
                ),
                Text('Price per liter: ${controller.pricePerLiter(product.id)}')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
