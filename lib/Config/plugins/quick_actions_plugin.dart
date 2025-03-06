import 'package:permissions_app/Config/config.dart';
import 'package:quick_actions/quick_actions.dart';

class QuickActionsPlugin {
  static registerActions() {
    const QuickActions quickActions = QuickActions();
    quickActions.initialize((shortcutType) {
      print(shortcutType);

      switch (shortcutType) {
        case 'biometric':
          router.push('/biometrics');
          break;
        case 'compass':
          router.push('/compass');
          break;
        case 'pokemons':
          router.push('/pokemons');
          break;
        case 'charmander':
          router.push('/pokemons/4');
          break;
      }

      // More handling code...
    });
    quickActions.setShortcutItems(<ShortcutItem>[
      const ShortcutItem(
        type: 'biometric',
        localizedTitle: 'Biometric',
        icon: 'icon_main',
      ),
      const ShortcutItem(
        type: 'compass',
        localizedTitle: 'Compass',
        icon: 'icon_main',
      ),
      const ShortcutItem(
        type: 'pokemons',
        localizedTitle: 'Pokemons',
        icon: 'icon_main',
      ),
      const ShortcutItem(
        type: 'charmander',
        localizedTitle: 'Charmander',
        icon: 'icon_main',
      ),
    ]);
  }
}
