import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:permissions_app/Config/config.dart';

final canCheckBiometricsProvider = FutureProvider<bool>((ref) async {
  return await LocalAuthPlugin.canCheckBiometrics();
});

enum LocalAuthStatus { authenticated, notAuthenticated, autheticating }

class LocalAuthState {
  final bool didAuthenticate;
  final LocalAuthStatus status;
  final String message;

  LocalAuthState({
    this.didAuthenticate = false,
    this.status = LocalAuthStatus.autheticating,
    this.message = '',
  });

  LocalAuthState copyWith({
    bool? didAuthenticate,
    LocalAuthStatus? status,
    String? message,
  }) => LocalAuthState(
    didAuthenticate: didAuthenticate ?? this.didAuthenticate,
    status: status ?? this.status,
    message: message ?? this.message,
  );
}

class LocalAuthNotifier extends StateNotifier<LocalAuthState> {
  LocalAuthNotifier() : super(LocalAuthState());

  Future<(bool, String)> authenticateUser() async {
    final (didAuthenticate, message) = await LocalAuthPlugin.authenticate();

    state = state.copyWith(
      didAuthenticate: didAuthenticate,
      message: message,
      status:
          didAuthenticate
              ? LocalAuthStatus.authenticated
              : LocalAuthStatus.notAuthenticated,
    );
    return (didAuthenticate, message);
  }
}

final localAuthProvider =
    StateNotifierProvider<LocalAuthNotifier, LocalAuthState>((ref) {
      return LocalAuthNotifier();
    });
