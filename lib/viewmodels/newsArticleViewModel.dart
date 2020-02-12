import 'package:samachar/models/news_article.dart';

class NewsArticleViewModel {
  NewsArticle _newsArticle;

  //NewsArticleViewModel({this._newsArticle}); //since we have made the instance private we can't declare constructor as above  SO,
  NewsArticleViewModel({NewsArticle article}) : _newsArticle = article;

  String get title {
    return _newsArticle.title;
  }

  String get description {
    return _newsArticle.description;
  }

  String get imageUrl {
    return _newsArticle.urlToImage;
  }

  String get url {
    return _newsArticle.url;
  }
}
