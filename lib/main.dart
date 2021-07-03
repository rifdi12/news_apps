import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_apps/bloc/detail_bloc.dart';
import 'package:news_apps/bloc/headlines_bloc.dart';
import 'package:news_apps/bloc/search_bloc.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MultiBlocProvider(
          providers: [
            BlocProvider<HeadlinesBloc>(
              create: (BuildContext context) => HeadlinesBloc(),
            ),
            BlocProvider<DetailBloc>(
              create: (BuildContext context) => DetailBloc(),
            ),
            BlocProvider<SearchBloc>(
              create: (BuildContext context) => SearchBloc(),
            ),
          ],
          child: MyHomePage(),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(24),
              height: 350,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(30)),
                image: DecorationImage(
                    image: NetworkImage(
                      'https://cdn-2.tstatic.net/tribunnews/foto/bank/images/nakesoronaminc.jpg',
                    ),
                    fit: BoxFit.cover),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '2 Kunci Penting Turunkan Kasus Positif Covid-19 di Indonesia Artikel ini telah tayang di Tribunnews.com dengan judul 2 Kunci Penting Turunkan Kasus Positif Covid-19 di Indonesia, https://www.tribunnews.com/kesehatan/2021/07/02/2-kunci-penting-turunkan-kasus-positif-covid-19-di-indonesia.',
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
                  Row(
                    children: [
                      Text(
                        'Baca Selengkapnya',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Icon(
                        Icons.arrow_right_alt_outlined,
                        color: Colors.white,
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Container(
              padding: EdgeInsets.all(18),
              child: Text(
                'Breaking News',
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
            Container(
              height: 250,
              child: ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    return Container(
                      width: 250,
                      margin: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              'https://cdn-2.tstatic.net/tribunnews/foto/bank/images/nakesoronaminc.jpg',
                              height: 150,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '2 Kunci Penting Turunkan Kasus Positif Covid-19 di Indonesia Artikel ini telah tayang di Tribunnews.com dengan judul 2 Kunci Penting Turunkan Kasus Positif Covid-19 di Indonesia, https://www.tribunnews.com/kesehatan/2021/07/02/2-kunci-penting-turunkan-kasus-positif-covid-19-di-indonesia.',
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '4 Jam yang lalu',
                            style:
                                TextStyle(color: Colors.black45, fontSize: 12),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            'By ESPN',
                            style:
                                TextStyle(color: Colors.black45, fontSize: 12),
                          )
                        ],
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 18,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(18, 18, 18, 0),
              child: Text(
                'Tech News',
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
            ListView.builder(
                itemCount: 4,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (ctx, index) {
                  return Container(
                    margin: EdgeInsets.all(12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            'https://cdn-2.tstatic.net/tribunnews/foto/bank/images/nakesoronaminc.jpg',
                            height: 120,
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '2 Kunci Penting Turunkan Kasus Positif Covid-19 di Indonesia Artikel ini telah tayang di Tribunnews.com dengan judul 2 Kunci Penting Turunkan Kasus Positif Covid-19 di Indonesia, https://www.tribunnews.com/kesehatan/2021/07/02/2-kunci-penting-turunkan-kasus-positif-covid-19-di-indonesia.',
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '4 Jam yang lalu',
                                style: TextStyle(
                                    color: Colors.black45, fontSize: 12),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(
                                'By ESPN',
                                style: TextStyle(
                                    color: Colors.black45, fontSize: 12),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
