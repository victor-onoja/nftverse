import 'package:flutter/material.dart';
import 'package:nftverse/features/market/model/mpitem.dart';

class MPITEMS with ChangeNotifier {
  final List<MPITEM> _mpitems = [
    MPITEM(image: 'images/nft.png', title: 'Title', price: 12, id: 'm1'),
    MPITEM(image: 'images/nft.png', title: 'Title2', price: 12, id: 'm2'),
    MPITEM(image: 'images/nft.png', title: 'Title3', price: 12, id: 'm3'),
  ];
  List<MPITEM> get mpitems {
    return [..._mpitems];
  }

  List<MPITEM> get myItems {
    return _mpitems.where((element) => element.isMine).toList();
  }

  MPITEM findById(String id) {
    return _mpitems.firstWhere((prod) => prod.id == id);
  }

  void addProduct() {
    // _items.add(value);
    notifyListeners();
  }
}
