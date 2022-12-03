import 'package:flutter/material.dart';
import 'package:nftverse/features/market/widget/mpitemwidget.dart';

import 'package:provider/provider.dart';

import '../model/mpitems.dart';

class GridWidget extends StatelessWidget {
  final bool showMine;
  const GridWidget({
    Key? key,
    required this.showMine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mpitemData = Provider.of<MPITEMS>(context);
    final mpitems = showMine ? mpitemData.myItems : mpitemData.mpitems;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: mpitems.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        // builder: (c) => mpitems[i],
        value: mpitems[i],
        child: const MPITEMWidget(),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
