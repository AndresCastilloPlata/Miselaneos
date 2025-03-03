import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permissions_app/Config/config.dart';

final canCheckBiometricsProvider = FutureProvider<bool>((ref) async {
  return await LocalAuthPlugin.canCheckBiometrics();
});
