import 'package:flutter/material.dart';
import 'package:nftverse/constants/themes.dart';

import 'features/welcome/routes/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Niftyverse',
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}
