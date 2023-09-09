import 'package:dio/dio.dart';
import 'package:test_zadanie/data/models/hotel/home_screen_model.dart';

class Repository {
  final dio = Dio();
  Future<Data> getData() async {
    Response response = await dio
        .get('https://run.mocky.io/v3/35e0d18e-2521-4f1b-a575-f0fe366f66e3');

    var body = response.data;

    return Data.fromJson(body);
  }
}
