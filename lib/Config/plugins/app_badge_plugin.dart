import 'package:flutter_badge_manager/flutter_badge_manager.dart';

class AppBadgePlugin {
  static Future<bool> get isBadgeSupported {
    return FlutterBadgeManager.isSupported();
  }

  static void updateBadgeCount(int count) async {
    if (!await isBadgeSupported) {
      print('Badge no soportado');
      return;
    }
    FlutterBadgeManager.update(count);

    if (count == 0) removeBadge();
  }

  static void removeBadge() async {
    if (!await isBadgeSupported) {
      print('Badge no soportado');
      return;
    }
    FlutterBadgeManager.remove();
  }
}
