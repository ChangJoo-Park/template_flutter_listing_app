import 'package:flutter/material.dart';
import 'package:flutter_listing_app/widgets/pages/setting_page.dart';
import 'widgets/pages/home_page.dart';
import 'widgets/pages/list_page.dart';
import 'widgets/pages/login_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/listing':
        // Validation of correct data type
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => ListPage(
                  data: args,
                ),
          );
        }
        // If args is not of the correct type, return an error page.
        // You can also throw an exception while in development.
        return _errorRoute();
      case '/settings':
        return MaterialPageRoute(
          builder: (_) => SettingPage(),
        );
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage());
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
