import 'package:flutter/material.dart';

class FilledTonalButtons extends StatelessWidget {
  const FilledTonalButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FilledButton.tonal(
          onPressed: () {},
          child: const Text('FilledButton tonal'),
        ),
        FilledButton.tonalIcon(
          onPressed: () {},
          icon: const Icon(Icons.save),
          label: const Text('FilledButton tonal icon'),
        ),
      ],
    );
  }
}