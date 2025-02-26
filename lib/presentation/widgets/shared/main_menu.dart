import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final IconData icon;
  final String route;

  MenuItem(this.title, this.icon, this.route);
}

final menuItems = <MenuItem>[
  MenuItem('Giróscopio', Icons.downloading_rounded, '/gyroscope'),
  MenuItem('Acelerómetro', Icons.speed_rounded, '/accelerometer'),
  MenuItem('Magnómetro', Icons.explore_outlined, '/magnetometer'),
  MenuItem(
    'Giróscopio Ball',
    Icons.sports_baseball_outlined,
    '/gyroscope_ball',
  ),
  MenuItem('Brújula', Icons.explore_rounded, '/compass'),
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
    this.bgColors = const [Colors.lightBlue, Colors.blueAccent],
  });

  @override
  Widget build(BuildContext context) {
    return Container(color: bgColors[0]);
  }
}
