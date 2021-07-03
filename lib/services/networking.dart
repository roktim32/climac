import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    final http.Response respone = await http.get(Uri.parse(url));

    if (respone.statusCode == 200) {
      String data = respone.body;

      var decodedData = jsonDecode(data);
      return decodedData;
    } else {
      print(respone.statusCode);
    }
  }
}
