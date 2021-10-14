import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CallApi {
  final String _url = "https://masjidku.my/api/";
  var _token;
  postDataLogin(data) {
    Uri fullUrl = Uri.parse(_url + 'login');
    return http.post(fullUrl, body: jsonEncode(data), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    });
  }

  postData(data, url) async {
    Uri fullUrl = Uri.parse(_url + url);
    await _getToken();
    return http.post(fullUrl, body: jsonEncode(data), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $_token'
    });
  }

  getData(url) async {
    Uri fullUrl = Uri.parse(_url + url);
    await _getToken();
    return http.get(fullUrl, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $_token'
    });
  }

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    this._token = localStorage.getString('token');
  }
}
