part of 'home_screen_bloc.dart';

abstract class HomeScreenState {}

final class HomeScreenInitial extends HomeScreenState {}

class HomeScreenLoadInf extends HomeScreenState {
  HomeScreenLoadInf({
    required this.data,
  });
  final Data data;
}

class HomeScreenTest extends HomeScreenState {
  HomeScreenTest({
    required this.launchurl,
  });

  final Uri launchurl;
}

class HomeScreenLoading extends HomeScreenState {}

class HomeScreenLoadingFailed extends HomeScreenState {}
