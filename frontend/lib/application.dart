import 'package:flutter/material.dart';
import 'package:frontend/screens/home_screen.dart';
import 'package:frontend/screens/not_found_screen.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeScreen.routeName,
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) {
            return NotFoundScreen();
          },
        );
      },
      onGenerateRoute: (settings) {
        final screen = switch (settings.name) {
          HomeScreen.routeName => HomeScreen(),
          _ => null,
        };

        if (screen != null) {
          return MaterialPageRoute(
            builder: (context) {
              return screen;
            },
          );
        }

        return null;
      },
    );
  }
}
