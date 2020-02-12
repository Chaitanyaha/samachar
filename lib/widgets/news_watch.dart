import 'package:flutter/material.dart';
import 'package:samachar/viewmodels/newsArticleListViewModel.dart';
import 'package:samachar/viewmodels/newsArticleViewModel.dart';

class NewsWatch extends StatelessWidget {
  const NewsWatch({Key key, @required this.vm, @required this.onSelected})
      : super(key: key);

  final NewsArticleListViewModel vm;
  final Function(NewsArticleViewModel article) onSelected;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: vm.articles.length,
      itemBuilder: (context, index) {
        final article = vm.articles[index];
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: <Widget>[
              ListTile(
                onTap: () {
                  this.onSelected(article);
                },
                title: Text(article.title),
                leading: Container(
                  child: article.imageUrl != null
                      ? Image.network(
                          vm.articles[index].imageUrl,
                          fit: BoxFit.cover,
                        )
                      : InkWell(
                          child: Icon(
                            Icons.search,
                            size: 40,
                          ),
                        ),
                  height: 100,
                  width: 100,
                ),
              ),
              Divider(color: Colors.white54,),
            ],
          ),
        );
      },
    );
  }
}
