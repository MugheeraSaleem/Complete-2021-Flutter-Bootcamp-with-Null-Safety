import 'package:flutter/material.dart';

class custom_card extends StatelessWidget {
  const custom_card({
    Key? key,
    required this.selectedcryptocurrency,
    required this.CoinValue,
    required this.selectedfiatcurrency,
  }) : super(key: key);

  final String selectedcryptocurrency;
  final String CoinValue;
  final String? selectedfiatcurrency;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          child: Text(
            '1 $selectedcryptocurrency = $CoinValue $selectedfiatcurrency',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
