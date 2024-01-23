import 'dart:convert';
import 'package:news_nook/model/news.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  Future<News?> getnews() async {
    var client = http.Client();

    var response = await client.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=6af986e22563483081e2408913b6a81f'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return News.fromJson(data);
    } else {
      return null;
    }
  }
}
