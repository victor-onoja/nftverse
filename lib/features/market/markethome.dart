import 'package:flutter/material.dart';

class MarketHome extends StatefulWidget {
  const MarketHome({super.key});

  @override
  State<MarketHome> createState() => _MarketHomeState();
}

class _MarketHomeState extends State<MarketHome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('NiftyMarket'),
      ),
    ));
  }
}
