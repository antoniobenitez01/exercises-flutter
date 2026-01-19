import 'package:flutter/material.dart';

class FilledButtons extends StatelessWidget {
  const FilledButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const FilledButton(
          onPressed: null,
          child: Text('FilledButton desabilitado'),
        ),
        FilledButton(
          onPressed: () {},
          child: const Text('FilledButton normal'),
        ),
        FilledButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.save),
          label: const Text('FilledButton con ícono'),
        ),
      ],
    );
  }
}