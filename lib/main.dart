import 'package:flutter/material.dart';
import 'package:permissions_app/Config/config.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      home: Scaffold(body: Center(child: Text('Hello World!'))),
    );
  }
}
