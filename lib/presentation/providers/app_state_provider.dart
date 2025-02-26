import 'package:flutter/material.dart' show AppLifecycleState;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appStateProvider = StateProvider<AppLifecycleState>((ref) {
  return AppLifecycleState.resumed;
});
/*
  resumed: La aplicación está en primer plano y está recibiendo entrada del usuario.
  inactive: La aplicación está en primer plano, pero no responde a la entrada del usuario (Multitarea).
  paused: La aplicación está en segundo plano y no está ejecutando código.
  detached: La aplicación se cerró.
*/
