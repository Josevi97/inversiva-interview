import 'package:flutter/material.dart';
import 'package:frontend/screens/users_screen/users_screen.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/";

  const HomeScreen({super.key});

  void _navigateToUsers(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        settings: RouteSettings(name: UsersScreen.routeName),
        builder: (context) {
          return UsersScreen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          color: Colors.amber,
          padding: const EdgeInsets.all(16),
          child: Text("Visitar usuarios"),
          onPressed: () => _navigateToUsers(context),
        ),
      ),
    );
  }
}
