import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ControlledTextField extends StatefulWidget {
  const ControlledTextField({
    Key? key,
    required this.onChanged,
    required this.text,
    this.decoration,
    this.keyboardType,
    this.inputFormatters,
  }) : super(key: key);

  final void Function(String)? onChanged;
  final String text;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<ControlledTextField> createState() => _ControlledTextFieldState();
}

class _ControlledTextFieldState extends State<ControlledTextField> {
  final TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    _controller.text = widget.text;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onChanged: widget.onChanged,
      decoration: widget.decoration,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
    );
  }
}
