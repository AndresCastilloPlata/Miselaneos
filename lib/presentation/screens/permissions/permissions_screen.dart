import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PermissionsScreen extends StatelessWidget {
  const PermissionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Permisos requeridos')),
      body: _PermissionsView(),
    );
  }
}

class _PermissionsView extends ConsumerWidget {
  const _PermissionsView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        CheckboxListTile(
          title: const Text('Camara'),
          subtitle: const Text('Permite acceder a la camara'),
          value: true,
          onChanged: (value) {},
        ),
      ],
    );
  }
}
