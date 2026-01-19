import 'package:flutter/material.dart';

class OutlinedButtons extends StatelessWidget {
  const OutlinedButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const OutlinedButton(
          onPressed: null,
          child: Text('OutlinedButton deshabilitado'),
        ),
        OutlinedButton(
          onPressed: () {},
          child: const Text('OutlinedButton normal'),
        ),
        OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.save),
          label: const Text('OutlinedButton con ícono'),
        ),
      ],
    );
  }
}