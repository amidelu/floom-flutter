import 'package:floom/src/all_features/authentication/auth_screen.dart';
import 'package:floom/src/all_features/navigationpage.dart';
import 'package:floom/src/settings/settings_controller.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class AppRouter {
  final SettingsController settingsController;
  AppRouter(this.settingsController);

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case navigationPage:
        return MaterialPageRoute(
          builder: (_) => const NavigationPage(),
        );
      // case settingsPage:
      //   return MaterialPageRoute(
      //     builder: (_) => SettingsView(controller: settingsController,),
      //   );
      case authScreen:
        return MaterialPageRoute(
          builder: (_) => const AuthScreen(),
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Error Screen')),
      ),
    );
  }
}
