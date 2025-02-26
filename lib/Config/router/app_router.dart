import 'package:go_router/go_router.dart';
import 'package:permissions_app/presentation/screens/screens.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => HomeScreen()),
    GoRoute(
      path: '/permissions',
      builder: (context, state) => PermissionsScreen(),
    ),
  ],
);
