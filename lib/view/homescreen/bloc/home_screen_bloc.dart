import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:test_zadanie/data/repositories/repository.dart';

import '../../../data/models/hotel/home_screen_model.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc(this.repository) : super(HomeScreenInitial()) {
    on<HomeScreenLoad>(_onHomeScreenLoad);
  }

  final Repository repository;

  void _onHomeScreenLoad(
      HomeScreenLoad event, Emitter<HomeScreenState> emit) async {
    try {
      emit(HomeScreenLoading());
      final result = await repository.getData();
      emit(HomeScreenLoadInf(data: result));
    } catch (e) {}
  }
}
