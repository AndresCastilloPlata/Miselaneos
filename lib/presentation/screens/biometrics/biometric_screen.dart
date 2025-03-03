import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permissions_app/presentation/providers/providers.dart';

class BiometricScreen extends ConsumerWidget {
  const BiometricScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final canCheckBiometris = ref.watch(canCheckBiometricsProvider);
    final localAuthState = ref.watch(localAuthProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Biometric Scree')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                ref.read(localAuthProvider.notifier).authenticateUser();
              },
              child: const Text('Autenticar'),
            ),

            canCheckBiometris.when(
              data: (canCheck) => Text('Puede revisar biométricos: $canCheck'),
              error: (error, stackTrace) => Text('Error: $error'),
              loading: () => const CircularProgressIndicator(),
            ),

            const SizedBox(height: 40),
            const Text('Estado del biométrico', style: TextStyle(fontSize: 30)),
            Text(
              'Estado $localAuthState',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
