import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
enum HttpRequest { get, post }

class HttpService {
  HttpService._();

  final baseUrl = "https://jsonplaceholder.typicode.com/posts";
  static final HttpService instance = HttpService._();

  BuildContext? _buildContext;

  init(context) {
    _buildContext = context;
  }

  Future _request(HttpRequest type, String url, data) async {
    debugPrint('-------------------------------------------');
    debugPrint('$type - $url');

    try {
      late http.Response response;
      if (type == HttpRequest.post) {
        response = await http.post(Uri.parse(url), body: jsonEncode(data));
      }
      if (type == HttpRequest.get) {
        response = await http.get(Uri.parse(url));
      }
      debugPrint('response code : ${response.statusCode}');
      if(response.statusCode == 200){
        var body = jsonDecode(response.body);
        debugPrint('response body ${jsonEncode(body)}');
        return body;
      }
      else{
        debugPrint('response status code failed  ${ response.statusCode}');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'something went Wrong');
      debugPrint('error ${e.toString()}');
    }
  }

  Future getAllPosts()async{
       return _request(HttpRequest.get, baseUrl, null);
  }

}
