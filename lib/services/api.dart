import 'dart:convert';

import 'package:http/http.dart' as http;

class CallApi {
  final String _url = "https://masjidku.my/api/";

  postDataLogin(data) {
    Uri fullUrl = Uri.parse(_url + 'login');
    return http.post(fullUrl, body: jsonEncode(data), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    });
  }
}
