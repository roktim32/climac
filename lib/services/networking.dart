import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    // void getData() async {
    // final apiKey = "a24cffa1713095d4afd649dda636114d";
    // final requestUrl =url;

    final http.Response respone = await http.get(Uri.parse(url));

    if (respone.statusCode == 200) {
      String data = respone.body;
      // print(data);
      // var longitude = jsonDecode(data)['coord']['lon'];
      // var weatherDescription = jsonDecode(data)['weather'][0]['description'];
      var decodedData = jsonDecode(data);
      return decodedData;
    } else {
      print(respone.statusCode);
    }
  }
}
