import 'package:flutter/material.dart';
import 'package:restaurant_app_1/data/model/restaurant.dart';
import 'package:restaurant_app_1/presentation/pages/detail_page.dart';
import 'package:restaurant_app_1/presentation/pages/home_page.dart';
import 'package:restaurant_app_1/presentation/pages/splash_page.dart';

class MyRoutes {
  static const String splashRoute = '/';
  static const String homeRoute = '/home';
  static const String detailRoute = '/detail';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
        );
      case homeRoute:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      case detailRoute:
        var resto = settings.arguments as Restaurant;
        return MaterialPageRoute(
          builder: (_) => DetailPage(restaurant: resto),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('No Route'),
            ),
          ),
        );
    }
  }
}
