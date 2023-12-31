import 'package:flutter/material.dart';
import 'package:restaurant_app_1/config/app_route.dart';
import 'package:restaurant_app_1/config/theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      onGenerateRoute: MyRoutes.onGenerateRoute,
      initialRoute: MyRoutes.splashRoute,
    );
  }
}
