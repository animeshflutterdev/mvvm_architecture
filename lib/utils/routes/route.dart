import 'package:flutter/material.dart';
import 'package:new_mvvm/view/register.dart';
import 'package:new_mvvm/view/splash_view.dart';

import '../../view/home.dart';
import '../../view/login.dart';
import 'routes_name.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (_) => Home(
                  title: settings.name.toString(),
                ));
      case RoutesName.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RoutesName.register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case RoutesName.splash:
        return MaterialPageRoute(builder: (_) => const SplashView());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text("No route found"),
            ),
          );
        });
    }
  }
}
