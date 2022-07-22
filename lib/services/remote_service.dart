import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mvians/model/home_page_models/qoutes_models.dart';

class RemoteServices {
  static var client = http.Client();
  //? url
  final String _url = "https://yephow.herokuapp.com/api/v1/";


  //? fetching qoutes 
  static Future<List<Qoutes>> fetchQoutes(String url) async {
    http.Response response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var list = <Qoutes>[];
      var jsonString = response.body;
      list.add(qoutesFromJson(jsonString));
      return list;
    } else {
      return [];
    }
  }

  //? headers
  _setheaders() =>
      {"Content-Type": "application/json", "Accept": "application/json"};
  //* posting data
  postData(Map data, String apiUrl) async {
    String fullUrl = _url + apiUrl;
    return await http.post(Uri.parse(fullUrl),
        body: jsonEncode(data), headers: _setheaders());
  }
}
