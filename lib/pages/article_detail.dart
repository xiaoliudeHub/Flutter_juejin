import 'package:flutter/material.dart';


class ArticleDetailPage extends StatefulWidget {

  final String articleUrl;
  final String title;
  ArticleDetailPage(this.articleUrl, this.title);

  @override
  _ArticleDetailPageState createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends State<ArticleDetailPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(widget.title),
      ),
      body: Center(
        child:Text('这篇文章的id是'),
      ),
    );
  }
}