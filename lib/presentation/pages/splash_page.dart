import 'dart:async';

import 'package:flutter/material.dart';
import 'package:restaurant_app_1/config/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 1000), () {
      Navigator.pushReplacementNamed(context, "/home");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: orangeColor,
        child: Center(
          child: Text(
            'Yummy App',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: whiteColor,
                  fontWeight: FontWeight.w700,
                ),
          ),
        ),
      ),
    );
  }
}
