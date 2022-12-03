class MPITEM {
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
}

final List<MPITEM> mpitems = [
  MPITEM(image: 'images/nft.png', title: 'Title', price: 12, id: 'm1'),
  MPITEM(image: 'images/nft.png', title: 'Title2', price: 12, id: 'm2'),
  MPITEM(image: 'images/nft.png', title: 'Title3', price: 12, id: 'm3'),
];
