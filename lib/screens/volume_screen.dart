import 'package:flutter/material.dart';

class VolumeScreen extends StatefulWidget {
  const VolumeScreen({Key? key}) : super(key: key);

  @override
  State<VolumeScreen> createState() => _VolumeScreenState();
}

class _VolumeScreenState extends State<VolumeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: Text('Volume')),
      appBar: AppBar(
        backgroundColor: Colors.amber[800],
        title: const Text('Volume'),
      ),
    );
  }
}
