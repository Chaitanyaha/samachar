import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samachar/pages/newsArticleDetails.dart';
import 'package:samachar/viewmodels/newsArticleListViewModel.dart';
import 'package:samachar/viewmodels/newsArticleViewModel.dart';
import 'package:samachar/widgets/drawer_menu.dart';
import 'package:samachar/widgets/news_watch.dart';

class NewsList extends StatefulWidget {
  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  final _controller = TextEditingController();
  bool check = false;

  @override
  void initState() {
    super.initState();

    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .populateTopHeadlines();
  }

  void _showNewsArticleDetails(
      BuildContext context, NewsArticleViewModel article) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NewsArticlesDetailsPage(article: article)));
  }

  Widget _buildList(BuildContext context, NewsArticleListViewModel vm) {
    switch (vm.loadingStatus) {
      case LoadingStatus.searching:
        return Align(child: CircularProgressIndicator());

      case LoadingStatus.completed:
        return Expanded(
            child: NewsWatch(
          vm: vm,
          onSelected: (article) {
            _showNewsArticleDetails(context, article);
          },
        ));
        break;
      case LoadingStatus.empty:
        return Align(
          child: Text('No result found'),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<NewsArticleListViewModel>(context);
    return SafeArea(
      child: Scaffold(
        drawer: DrawMenu(),
        appBar: AppBar(
          title: Text('Top News'),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  vm.searchKeyword(value);
                  check = true;
                }
              },
              decoration: InputDecoration(
                  labelText: 'Enter search term',
                  icon: Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(Icons.search, size: 30),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear, size: 20),
                    onPressed: _controller.clear,
                  )),
            ),
            _buildList(context, vm),
          ],
        ),
      ),
    );
  }
}
