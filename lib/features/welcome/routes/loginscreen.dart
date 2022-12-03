import 'package:flutter/material.dart';
import 'package:nftverse/features/market/routes/markethome.dart';
import 'package:slider_button/slider_button.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';
import '../../../constants/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //connector for connecting flutter dapp to wallet
  var connector = WalletConnect(
      bridge: 'https://bridge.walletconnect.org',
      clientMeta: const PeerMeta(
          name: 'Niftyverse',
          description: 'A metaverse with NFTs as the currency',
          url: 'https://walletconnect.org',
          icons: [
            'https://files.gitbook.com/v0/b/gitbook-legacy-files/o/spaces%2F-LJJeCjcLrr53DcT1Ml7%2Favatar.png?alt=media'
          ]));

  var _session, _uri;

  loginUsingMetamask(BuildContext context) async {
    //if connector is not connected
    if (!connector.connected) {
      try {
        var session = await connector.createSession(onDisplayUri: (uri) async {
          _uri = uri;
          await launchUrlString(uri, mode: LaunchMode.externalApplication);
        });
        setState(() {
          _session = session;
        });
      } catch (exp) {
        print(exp);
      }
    } else
      print('connected already');
  }

  getNetworkName(chainId) {
    switch (chainId) {
      case 1:
        return 'Ethereum Mainnet';
      case 3:
        return 'Ropsten Testnet';
      case 4:
        return 'Rinkeby Testnet';
      case 5:
        return 'Goreli Testnet';
      case 42:
        return 'Kovan Testnet';
      case 137:
        return 'Polygon Mainnet';
      case 80001:
        return 'Mumbai Testnet';
      default:
        return 'Unknown Chain';
    }
  }

  @override
  Widget build(BuildContext context) {
    connector.on(
        'connect',
        (session) => setState(
              () {
                _session = _session;
              },
            ));
    connector.on(
        'session_update',
        (payload) => setState(() {
              _session = payload;
            }));
    connector.on(
        'disconnect',
        (payload) => setState(() {
              _session = null;
            }));
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('NiftyLogin'),
        ),
        body: Center(
          child: Column(
            children: [
              Image.asset('images/logo.png'),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              //if session is not null
              (_session != null)
                  ? Container(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Account: ',
                              style: Theme.of(context).textTheme.bodyText1),
                          Text('${_session.accounts[0]}',
                              style: Theme.of(context).textTheme.bodyText1),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Text('Chain: ',
                                  style: Theme.of(context).textTheme.bodyText1),
                              Text(
                                getNetworkName(_session.chainId),
                                style: Theme.of(context).textTheme.bodyText1,
                              )
                            ],
                          ),
                          const SizedBox(height: 45),
                          (_session.chainId != 80001)
                              ? Row(
                                  children: const [
                                    Icon(Icons.warning,
                                        color: Colors.redAccent, size: 15),
                                    Text(
                                      'Network not supported.\n Switch to Mumbai Testnet',
                                      style: TextStyle(color: Colors.red),
                                    )
                                  ],
                                )
                              : Container(
                                  alignment: Alignment.center,
                                  child: SliderButton(
                                    backgroundColor: AppColors.button,
                                    shimmer: false,
                                    action: () async {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) => MarketHome(
                                                  connector: connector,
                                                  session: _session,
                                                  uri: _uri)));
                                    },
                                    label: const Text('Slide to login'),
                                    icon: const Icon(Icons.check),
                                  ),
                                )
                        ],
                      ))
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(AppColors.others2)),
                      onPressed: () => loginUsingMetamask(context),
                      child: const Text('Connect with Metamask'),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
