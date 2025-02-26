import 'package:flutter/material.dart';
import 'package:permissions_app/Config/config.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // print('State: $state');
    /*
      resumed: La aplicación está en primer plano y está recibiendo entrada del usuario.
      inactive: La aplicación está en primer plano, pero no responde a la entrada del usuario (Multitarea).
      paused: La aplicación está en segundo plano y no está ejecutando código.
      detached: La aplicación se cerró.
    */
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      routerConfig: router,
    );
  }
}
