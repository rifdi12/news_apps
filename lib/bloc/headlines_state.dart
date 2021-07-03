part of 'headlines_bloc.dart';

@immutable
abstract class HeadlinesState {}

class HeadlinesInitial extends HeadlinesState {}

class HeadlinesLoading extends HeadlinesState {}

class HeadlinesLoaded extends HeadlinesState {
  final model;

  HeadlinesLoaded(this.model);
}
