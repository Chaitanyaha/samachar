import 'package:flutter/cupertino.dart';
import 'package:samachar/models/news_article.dart';
import 'package:samachar/services/webservice.dart';
import 'package:samachar/viewmodels/newsArticleViewModel.dart';

enum LoadingStatus { completed, searching, empty }

class NewsArticleListViewModel extends ChangeNotifier {
  var loadingStatus = LoadingStatus.searching;

  List<NewsArticleViewModel> articles = List<NewsArticleViewModel>();

  Future<void> populateTopHeadlines() async {
    this.loadingStatus = LoadingStatus.searching;
    notifyListeners();
    List<NewsArticle> newsArticles = await Webservice().fetchTopHeadlines();
    this.articles =
        newsArticles.map((a) => NewsArticleViewModel(article: a)).toList();
    this.loadingStatus =
        this.articles.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;
    notifyListeners();
  }

  Future<void> searchKeyword(String k) async {
    this.loadingStatus = LoadingStatus.searching;
    notifyListeners();
    List<NewsArticle> newsArticles =
        await Webservice().fetchHeadlinesByKeyword(k);
    this.articles =
        newsArticles.map((a) => NewsArticleViewModel(article: a)).toList();
    this.loadingStatus =
        this.articles.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;
    notifyListeners();
  }
}
