// import 'dart:math' show pi;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permissions_app/presentation/providers/providers.dart';
import 'package:permissions_app/presentation/screens/screens.dart';

class CompassScreen extends ConsumerWidget {
  const CompassScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationGranted = ref.watch(permissionsProvider).locationGranted;
    final compassHeading = ref.watch(compassArrowProvider);

    if (!locationGranted) {
      return const AskLocationScreen();
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Brújula', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: compassHeading.when(
          data: (heading) => Compass(heading: heading ?? 0),
          error:
              (error, stackTrace) => Text(
                'Error: $error',
                style: const TextStyle(color: Colors.white),
              ),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class Compass extends StatefulWidget {
  final double heading;

  const Compass({super.key, required this.heading});

  @override
  State<Compass> createState() => _CompassState();
}

class _CompassState extends State<Compass> {
  double prevValue = 0.0;
  double turns = 0;

  double getTurns() {
    double? direction = widget.heading;
    direction = (direction < 0) ? (360 + direction) : direction;

    double diff = direction - prevValue;
    if (diff.abs() > 180) {
      if (prevValue > direction) {
        diff = 360 - (direction - prevValue).abs();
      } else {
        diff = 360 - (prevValue - direction).abs();
        diff = diff * -1;
      }
    }

    turns += (diff / 360);
    prevValue = direction;

    return turns * -1;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 20,
      children: [
        Text(
          '${widget.heading.ceil()}',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            //* Giro unicamente flecha
            // Image.asset('assets/images/compass/quadrant-1.png'),

            // Transform.rotate(
            //   angle: (heading * (pi / 180) * -1),
            //   child: Image.asset('assets/images/compass/needle-1.png'),
            // ),

            // AnimatedRotation(
            //   turns: getTurns(),
            //   duration: const Duration(seconds: 1),
            //   curve: Curves.easeOut,
            //   child: Image.asset('assets/images/compass/needle-1.png'),
            // ),

            //* Giro unicamente quadrante
            AnimatedRotation(
              turns: getTurns(),
              duration: const Duration(seconds: 1),
              curve: Curves.easeOut,
              child: Image.asset('assets/images/compass/quadrant-1.png'),
            ),
            Image.asset('assets/images/compass/needle-1.png'),
          ],
        ),
      ],
    );
  }
}
