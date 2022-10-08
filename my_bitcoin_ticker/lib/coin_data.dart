import 'package:http/http.dart' as http;
import 'dart:convert';

const kAPIkey = '833F78F0-D241-4857-8982-CE72876987B1';
const kCoinApi = 'https://rest.coinapi.io/v1/exchangerate';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  late String selectedfiatcurrency = 'USD';
  late String selectedcryptocurrency;

  Future getCoinData(selectedfiatcurrency, selectedcryptocurrency) async {
    http.Response response = await http.get(
      Uri.parse(
          '$kCoinApi/$selectedcryptocurrency/$selectedfiatcurrency?apikey=$kAPIkey'),
    );
    if (response.statusCode == 200) {
      String data = response.body;

      var decoded_data = jsonDecode(data);
      return decoded_data['rate'];
    } else {
      print(response.statusCode);
      throw ('Error loading Data');
    }
  }
}
