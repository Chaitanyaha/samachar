import 'package:flutter/material.dart';
import 'package:samachar/viewmodels/newsArticleViewModel.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsArticlesDetailsPage extends StatelessWidget {
  final NewsArticleViewModel article;
  NewsArticlesDetailsPage({this.article});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${article.title}')),
      body: SafeArea(
        child: WebView(initialUrl: '${this.article.url}'),
      ),
    );
  }
}
