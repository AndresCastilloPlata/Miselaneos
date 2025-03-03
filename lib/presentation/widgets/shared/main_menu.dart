import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuItem {
  final String title;
  final IconData icon;
  final String route;

  MenuItem(this.title, this.icon, this.route);
}

final menuItems = <MenuItem>[
  MenuItem('Giróscopio', Icons.downloading_rounded, '/gyroscope'),
  MenuItem('Acelerómetro', Icons.speed_rounded, '/accelerometer'),
  MenuItem('Magnetómetro', Icons.explore_outlined, '/magnetometer'),
  MenuItem(
    'Giróscopio Ball',
    Icons.sports_baseball_outlined,
    '/gyroscope_ball',
  ),
  MenuItem('Brújula', Icons.explore_rounded, '/compass'),
  MenuItem('Pokemons', Icons.catching_pokemon, '/pokemons'),
  MenuItem('Biométricos', Icons.fingerprint, '/biometrics'),

  MenuItem('Ubicación', Icons.pin_drop, '/location'),
  MenuItem('Mapas', Icons.map_outlined, '/maps'),
  MenuItem('Controlado', Icons.gamepad_outlined, '/controlled-map'),
];

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.count(
      crossAxisCount: 3,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children:
          menuItems
              .map(
                (item) => HomeMenuItem(
                  title: item.title,
                  route: item.route,
                  icon: item.icon,
                ),
              )
              .toList(),
    );
  }
}

class HomeMenuItem extends StatelessWidget {
  final String title;
  final String route;
  final IconData icon;
  final List<Color> bgColors;

  const HomeMenuItem({
    super.key,
    required this.title,
    required this.route,
    required this.icon,
    this.bgColors = const [Colors.lightBlueAccent, Colors.lightBlue],
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(route),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(
            colors: bgColors,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 15,
          children: [
            Icon(icon, color: Colors.white, size: 40),
            Text(title, style: TextStyle(color: Colors.white, fontSize: 11)),
          ],
        ),
      ),
    );
  }
}
