import 'package:flutter/material.dart';

class TextButtons extends StatelessWidget {
  const TextButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextButton(
          onPressed: null,
          child: Text('TextButton deshabilitado'),
        ),
        TextButton(
          onPressed: () {},
          child: const Text('TextButton normal'),
        ),
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.save),
          label: const Text('TextButton con ícono'),
        ),
      ],
    );
  }
}