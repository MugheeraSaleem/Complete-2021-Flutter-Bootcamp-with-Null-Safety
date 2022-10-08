import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;

  Future getData() async {
    http.Response response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      String data = response.body;

      var decoded_data = jsonDecode(data);
      return decoded_data;
    } else {
      print(response.statusCode);
    }
  }
}
