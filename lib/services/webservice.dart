import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:samachar/models/news_article.dart';
import 'package:samachar/utils/constants.dart';

class Webservice {
  dynamic fetchHeadlinesByKeyword(String keyword) async {
    final response = await http.get(Constants.search(keyword));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result['articles'];
      return list.map((article) => NewsArticle.fromJSON(article)).toList();
    } else {
      throw Exception('Failed To Fetch The Details');
    }
  }

  dynamic fetchTopHeadlines() async {
    final response = await http.get(Constants.TopHeadlines);

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result['articles'];
      return list.map((article) => NewsArticle.fromJSON(article)).toList();
    } else {
      throw Exception('Failed To Fetch The Details');
    }
  }


}


