import 'package:http/http.dart' as http;
import 'dart:convert';

class Network {
  final String url;
  Network(this.url);

  Future<dynamic> getJasonData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsondata = jsonDecode(response.body);
      return jsondata;
    } else {
      print('Error caused by ${response.statusCode}');
    }
  }
}
