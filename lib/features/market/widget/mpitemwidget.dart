import 'package:flutter/material.dart';
import 'package:nftverse/features/market/model/mpitem.dart';
import 'package:provider/provider.dart';

class MPITEMWidget extends StatelessWidget {
  const MPITEMWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final item = Provider.of<MPITEM>(context, listen: false);
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('images/bg.png'))),
      child: Container(),
    );
  }
}
