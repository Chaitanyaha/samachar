import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MediaNews extends StatelessWidget {
  final String url;
  MediaNews({this.url});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('')),
      body: SafeArea(
        child: WebView(initialUrl: this.url),
      ),
    );
  }
}
