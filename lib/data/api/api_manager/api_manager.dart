import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/article_response/articles_response.dart';
import '../model/sources_response/source_response.dart';

class ApiManager {
  static const String baseUrl = "newsapi.org";
  static const String apiKey = "74a5f0867972405cb238f9e207c2852f";

  static Future<ArticleResponse> getArticles(String sourceId) async {
    Uri url = Uri.https(baseUrl, '/v2/top-headlines', {
      'apiKey': apiKey,
      'sources': sourceId,
    });

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return ArticleResponse.fromJson(json);
    } else {
      throw Exception(
          'Failed to load articles. Status code: ${response.statusCode}, Body: ${response.body}');
    }
  }

  static Future<SourceResponse> getSources(String categoryId) async {
    Uri url = Uri.https(baseUrl, '/v2/sources', {
      'apiKey': apiKey,
      'category': categoryId,
    });

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return SourceResponse.fromJson(json);
    } else {
      throw Exception(
          'Failed to load sources. Status code: ${response.statusCode}, Body: ${response.body}');
    }
  }
}
