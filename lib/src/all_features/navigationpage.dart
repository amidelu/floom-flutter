import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'screens/screens.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});
  static const routeName = '/';

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  bool isSigned = false;

  @override
  void initState() {
    super.initState();
    if (mounted) {
      FirebaseAuth.instance.authStateChanges().listen((user) {
        if (user != null) {
          setState(() {
            isSigned = true;
          });
        } else {
          setState(() {
            isSigned = false;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isSigned ? const HomePage() : const IntroAuth(),
    );
  }
}
