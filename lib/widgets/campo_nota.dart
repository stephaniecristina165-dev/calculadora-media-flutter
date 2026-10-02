import 'package:flutter/material.dart';

class CampoNota extends StatelessWidget {
  final TextEditingController controller;
  final String rotulo;

  const CampoNota({
    super.key,
    required this.controller,
    required this.rotulo,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: rotulo,
        border: const OutlineInputBorder(),
      ),
    );
  }
}