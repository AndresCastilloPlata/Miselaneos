import 'package:go_router/go_router.dart';
import 'package:permissions_app/presentation/screens/screens.dart';

final router = GoRouter(
  //* General
  routes: [
    GoRoute(path: '/', builder: (context, state) => HomeScreen()),
    GoRoute(
      path: '/permissions',
      builder: (context, state) => PermissionsScreen(),
    ),

    //* Sensors
    //* Sensors
    GoRoute(path: '/gyroscope', builder: (context, state) => GyroscopeScreen()),
    GoRoute(
      path: '/accelerometer',
      builder: (context, state) => AccelerometerScreen(),
    ),
    GoRoute(
      path: '/magnetometer',
      builder: (context, state) => MagnetometerScreen(),
    ),
    GoRoute(
      path: '/gyroscope_ball',
      builder: (context, state) => GyroscopeBallScreen(),
    ),
    GoRoute(path: '/compass', builder: (context, state) => CompassScreen()),

    //* Pokemons
    GoRoute(
      path: '/pokemons',
      builder: (context, state) => PokemonsScreen(),
      routes: [
        //todo
        // GoRoute(
        //   path: ':id',
        //   builder: (context, state) {
        //     return;
        //   },
        // ),
      ],
    ),
  ],
);
