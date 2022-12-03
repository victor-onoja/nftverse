import 'package:flutter/material.dart';

class MPITEM with ChangeNotifier {
  String id;
  String image;
  String title;
  double price;
  bool isMine;

  MPITEM(
      {required this.id,
      required this.image,
      required this.title,
      required this.price,
      this.isMine = false});
  void toggleFavoriteStatus() {
    isMine = !isMine;
    notifyListeners();
  }
}
