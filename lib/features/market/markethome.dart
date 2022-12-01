import 'package:flutter/material.dart';
import 'package:nftverse/constants/colors.dart';
import 'package:nftverse/features/market/mynfts.dart';

class MarketHome extends StatefulWidget {
  final connector, session, uri;
  const MarketHome(
      {Key? key,
      required this.connector,
      required this.session,
      required this.uri})
      : super(key: key);
  @override
  State<MarketHome> createState() => _MarketHomeState();
}

class _MarketHomeState extends State<MarketHome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text('NiftyMarket'),
            ),
            drawer: Drawer(
              backgroundColor: AppColors.background,
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  if (widget.session != null)
                    UserAccountsDrawerHeader(
                      accountName: const Text("NIFTY"),
                      accountEmail: Text('${widget.session.accounts[0]}'),
                      currentAccountPicture: const CircleAvatar(
                        radius: 70,
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage('images/icon.png'),
                      ),
                    ),
                  ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text("NiftyMarket"),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.wallet),
                    title: const Text("myNFTs"),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MyNFTs(
                              connector: widget.connector,
                              session: widget.session,
                              uri: widget.uri)));
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.new_label),
                    title: const Text("Mint an NFT"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.people),
                    title: const Text("NiftyDAO"),
                    onTap: () {},
                  ),
                ],
              ),
            )));
  }
}
