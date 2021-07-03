import 'package:flutter/material.dart';
import 'package:news_apps/models/news_models.dart';

class DetailNews extends StatefulWidget {
  final NewsModel newsModel;
  const DetailNews({Key key, this.newsModel}) : super(key: key);

  @override
  _DetailNewsState createState() => _DetailNewsState();
}

class _DetailNewsState extends State<DetailNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(24),
                height: 350,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        '${widget.newsModel.urlToImage}',
                      ),
                      fit: BoxFit.cover),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Icons.chevron_left,
                          color: Colors.white,
                          size: 40,
                        )),
                    Spacer(),
                    Text(
                      '${widget.newsModel.title}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(25),
                  ),
                ),
                padding: EdgeInsets.all(24),
                width: MediaQuery.of(context).size.width,
                transform: Matrix4.translationValues(0.0, -25.0, 0.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.black12),
                          child: Text(
                            '${widget.newsModel.source.name}',
                            style: TextStyle(color: Colors.black54),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(widget.newsModel.content)
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
