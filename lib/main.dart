import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samachar/pages/newsList.dart';
import 'package:samachar/viewmodels/newsArticleListViewModel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Samachar - Read First',
      theme:
          ThemeData(primarySwatch: Colors.purple, brightness: Brightness.dark),
      home: ChangeNotifierProvider(
        create: null,
        builder: (context) => NewsArticleListViewModel(),
        child: NewsList(),
      ),
    );
  }
}
