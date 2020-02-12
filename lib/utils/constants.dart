class Constants {
  static String TopHeadlines =
      'https://newsapi.org/v2/top-headlines?country=in&apiKey=7908febbedf147afb838d1ab66b410f4';

  static String search(dynamic k) {
    return 'https://newsapi.org/v2/everything?q=$k&apiKey=7908febbedf147afb838d1ab66b410f4';
  }
}
