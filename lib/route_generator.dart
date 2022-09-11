import 'package:flutter/material.dart';
import 'package:ryalize_test/ui/view/home_view.dart';
import 'package:ryalize_test/ui/view/login_view.dart';
import 'package:ryalize_test/ui/view/register_view.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/LoginView':
        return MaterialPageRoute(builder: (_) => LoginView());
      case '/RegisterView':
        return MaterialPageRoute(builder: (_) => RegisterView());
      case '/HomeView':
        return MaterialPageRoute(builder: (_) => HomeView());

      default:
        // If there is no such named route in the switch statement, e.g. /third
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                body: SafeArea(child: Center(child: Text('Route Error')))));
    }
  }
}