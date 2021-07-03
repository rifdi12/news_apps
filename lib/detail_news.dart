import 'package:flutter/material.dart';
import 'package:news_apps/models/news_models.dart';

class DetailNews extends StatefulWidget {
  final newsModel;
  const DetailNews({Key key, this.newsModel}) : super(key: key);

  @override
  _DetailNewsState createState() => _DetailNewsState();
}

class _DetailNewsState extends State<DetailNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
