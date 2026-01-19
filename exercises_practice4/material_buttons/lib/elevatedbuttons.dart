import 'package:flutter/material.dart';

class ElevatedButtons extends StatelessWidget {
  const ElevatedButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ElevatedButton(
          onPressed: null, // el null deshabilita el botón
          child: Text('ElevatedButton deshabilitado'),
        ),
        ElevatedButton(
          onPressed: () => {
            showDialog(
              context: context,
              builder: (context) => const AlertDialog(
                title: Text('ElevatedButton'),
              ),
            ),
          },
          child: const Text('ElevatedButton'),
        ),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.save),
          label: const Text('ElevatedButton con ícono'),
        )
      ],
    );
  }
}
