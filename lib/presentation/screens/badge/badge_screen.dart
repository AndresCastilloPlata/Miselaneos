import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permissions_app/Config/config.dart';
import 'package:permissions_app/presentation/providers/providers.dart';

class BadgeScreen extends ConsumerWidget {
  const BadgeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final badegCounter = ref.watch(badgeCounterProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('App Badge')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Badge(
              label: Text('$badegCounter'),
              alignment: Alignment.lerp(
                Alignment.topRight,
                Alignment.bottomRight,
                0.2,
              ),
              child: Text(
                '$badegCounter',
                style: const TextStyle(fontSize: 150),
              ),
            ),
            FilledButton.tonal(
              onPressed: () {
                ref.invalidate(badgeCounterProvider);
                AppBadgePlugin.removeBadge();
              },
              child: const Text('Borrar Badge'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ref.read(badgeCounterProvider.notifier).state++;
          // AppBadgePlugin.updateBadgeCount(badegCounter + 1);

          final newCount = ref.read(badgeCounterProvider.notifier).state++;
          AppBadgePlugin.updateBadgeCount(newCount);
        },
        child: Icon(Icons.plus_one_rounded),
      ),
    );
  }
}
