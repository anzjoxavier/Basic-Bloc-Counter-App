// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import '../Screens/home_screen.dart';
import '../Screens/second_screen.dart';
import '../Screens/third_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(
              title: 'First Screen', color: Colors.deepPurple),
        );
      case '/second_screen':
        return MaterialPageRoute(
          builder: (context) => const SecondScreen(
              title: 'Second Screen', color: Colors.blue),
        );
      case '/third_screen':
        return MaterialPageRoute(
          builder: (context) => const SecondScreen(
              title: 'Second Screen', color: Colors.blue),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => ThirdScreen(title: 'Second Screen', color: Colors.green),
        );
    }
  }
}
