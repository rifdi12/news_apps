import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

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
        var response = await Dio().get(
            'https://newsapi.org/v2/top-headlines?country=id&apiKey=ea9e8f5885ca46509bd0cabf1b56d94a');
        print(response);
      } catch (e) {
        print(e);
      }
    }
  }
}
