import 'package:flutter/material.dart';
import 'dart:async';

import 'loginscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  decideNavigaion() {
    Future.delayed(
        const Duration(milliseconds: 2900),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const LoginScreen())));
  }

  @override
  void initState() {
    super.initState();
    decideNavigaion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('images/1.png'),
      ),
    );
  }
}
