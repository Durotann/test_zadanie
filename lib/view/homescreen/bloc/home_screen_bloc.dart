import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import '../../../data/model/home_screen_model.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(HomeScreenInitial()) {
    on<HomeScreenLoad>((event, emit) async {
      Dio dio = Dio();
      try {
        emit(HomeScreenLoading());
        Response response = await dio.get(
            'https://run.mocky.io/v3/35e0d18e-2521-4f1b-a575-f0fe366f66e3');
        var body = response.data;
        final Data result = Data.fromJson(body);
        print(response.data);
        emit(HomeScreenLoadInf(data: result));
      } catch (e) {
        print('Произошла ошибка: $e');
      }
    });
  }
}
