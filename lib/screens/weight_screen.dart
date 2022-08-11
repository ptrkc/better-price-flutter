import 'package:flutter/material.dart';

class WeightScreen extends StatefulWidget {
  const WeightScreen({Key? key}) : super(key: key);

  @override
  State<WeightScreen> createState() => WeightState();
}

class WeightState extends State<WeightScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: Text('Weight')),
      appBar: AppBar(
        title: const Text('Weight'),
      ),
    );
  }
}
