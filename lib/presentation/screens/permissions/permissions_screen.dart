import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permissions_app/presentation/providers/providers.dart';

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
    final permissions = ref.watch(permissionsProvider);

    return ListView(
      children: [
        CheckboxListTile(
          title: const Text('Camara'),
          subtitle: Text('${permissions.camera}'),
          value: permissions.cameraGranted,
          onChanged: (value) {
            ref.read(permissionsProvider.notifier).requestCameraAccess();
          },
        ),
        CheckboxListTile(
          title: const Text('Galeria de fotos'),
          subtitle: Text('${permissions.photoLibrary}'),
          value: permissions.photoLibraryGranted,
          onChanged: (value) {
            ref.read(permissionsProvider.notifier).requestPhotoLibraryAccess();
          },
        ),
        CheckboxListTile(
          title: const Text('Localizacion'),
          subtitle: Text('${permissions.location}'),
          value: permissions.locationGranted,
          onChanged: (value) {
            ref.read(permissionsProvider.notifier).requestLocationAccess();
          },
        ),
        CheckboxListTile(
          title: const Text('Sensores'),
          subtitle: Text('${permissions.sensors}'),
          value: permissions.sensorsGranted,
          onChanged: (value) {
            ref.read(permissionsProvider.notifier).requestSensorsAccess();
          },
        ),
      ],
    );
  }
}
