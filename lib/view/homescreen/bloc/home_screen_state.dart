part of 'home_screen_bloc.dart';

abstract class HomeScreenState {}

final class HomeScreenInitial extends HomeScreenState {}

class HomeScreenLoadInf extends HomeScreenState {
  HomeScreenLoadInf({
    required this.data,
  });
  final Data data;
}

class HomeScreenLoading extends HomeScreenState {}

class HomeScreenLoadingFailed extends HomeScreenState {}
