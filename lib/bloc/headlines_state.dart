part of 'headlines_bloc.dart';

@immutable
abstract class HeadlinesState {}

class HeadlinesInitial extends HeadlinesState {}

class HeadlinesLoading extends HeadlinesState {}

class HeadlinesError extends HeadlinesState {}

class HeadlinesLoaded extends HeadlinesState {
  final List<NewsModel> modelBreaking;
  final List<NewsModel> modelTech;
  final NewsModel modelHead;

  HeadlinesLoaded(this.modelBreaking, this.modelTech, this.modelHead);
}
