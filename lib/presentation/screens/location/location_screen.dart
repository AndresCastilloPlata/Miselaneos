import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permissions_app/presentation/providers/providers.dart';

class LocationScreen extends ConsumerWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userLocationAsync = ref.watch(userLocationProvider);
    final watchLocationAsync = ref.watch(watchLocationProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Ubicación')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 30,
          children: [
            // Current location
            const Text('Ubicación actual'),
            userLocationAsync.when(
              data: (data) => Text('$data'),
              error: (error, stackTrace) => Text('Error: $error'),
              loading: () => const CircularProgressIndicator(),
            ),
            // Current location
            const Text('Seguimiento de Ubicación'),
            watchLocationAsync.when(
              data: (data) => Text('$data'),
              error: (error, stackTrace) => Text('Error: $error'),
              loading: () => const CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
