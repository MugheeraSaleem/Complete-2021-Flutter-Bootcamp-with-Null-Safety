import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'CustomCard.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String? selectedfiatcurrency = 'USD';
  String selectedcryptocurrency = 'BTC';
  String BTCValue = '?';
  String ETHValue = '?';
  String LTCValue = '?';

  List<DropdownMenuItem<String>> getdropdownitems() {
    List<DropdownMenuItem<String>> dropdownlist = [];
    for (String item in currenciesList) {
      var newitem = DropdownMenuItem(
        child: Text(item),
        value: item,
      );
      dropdownlist.add(newitem);
    }
    return dropdownlist;
  }

  void displayingdata() async {
    try {
      var BTCdata = await CoinData().getCoinData(selectedfiatcurrency, 'BTC');
      var ETHdata = await CoinData().getCoinData(selectedfiatcurrency, 'ETH');
      var LTCdata = await CoinData().getCoinData(selectedfiatcurrency, 'LTC');
      setState(() {
        BTCValue = BTCdata.toStringAsFixed(0);
        ETHValue = ETHdata.toStringAsFixed(0);
        LTCValue = LTCdata.toStringAsFixed(0);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    displayingdata();
  }

  @override
  Widget build(BuildContext context) {
    getdropdownitems();
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('🤑 Coin Ticker')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          custom_card(
              selectedcryptocurrency: 'BTC',
              CoinValue: BTCValue,
              selectedfiatcurrency: selectedfiatcurrency),
          custom_card(
              selectedcryptocurrency: 'ETH',
              CoinValue: ETHValue,
              selectedfiatcurrency: selectedfiatcurrency),
          custom_card(
              selectedcryptocurrency: 'LTC',
              CoinValue: LTCValue,
              selectedfiatcurrency: selectedfiatcurrency),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: DropdownButton<String>(
              value: selectedfiatcurrency,
              items: getdropdownitems(),
              onChanged: (value) {
                setState(() {
                  selectedfiatcurrency = value;
                  displayingdata();
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
