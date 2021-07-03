import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:news_apps/models/news_models.dart';

part 'headlines_event.dart';
part 'headlines_state.dart';

class HeadlinesBloc extends Bloc<HeadlinesEvent, HeadlinesState> {
  HeadlinesBloc() : super(HeadlinesInitial());

  @override
  Stream<HeadlinesState> mapEventToState(
    HeadlinesEvent event,
  ) async* {
    if (event is GetHeadlines) {
      yield HeadlinesLoading();
      try {
        var response = await Future.wait([
          Dio().get(
              'https://newsapi.org/v2/top-headlines?country=id&apiKey=ea9e8f5885ca46509bd0cabf1b56d94a&category=general'),
          Dio().get(
              'https://newsapi.org/v2/top-headlines?country=id&apiKey=ea9e8f5885ca46509bd0cabf1b56d94a&category=technology')
        ]);
        List<NewsModel> modelTech = [];
        List<NewsModel> modelBreaking = [];
        NewsModel modelHead;
        for (var item in response[1].data['articles']) {
          modelTech.add(NewsModel.fromJson(item));
        }
        for (var i = 0; i < response[0].data['articles'].length; i++) {
          if (i == 1) {
            modelHead = NewsModel.fromJson(response[0].data['articles'][i]);
          } else {
            modelBreaking
                .add(NewsModel.fromJson(response[0].data['articles'][i]));
          }
        }
        yield HeadlinesLoaded(modelBreaking, modelTech, modelHead);
      } catch (e) {
        print(e);
        yield HeadlinesError();
      }
    }
  }
}
