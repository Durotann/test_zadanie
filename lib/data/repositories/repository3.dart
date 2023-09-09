import 'package:dio/dio.dart';
import 'package:test_zadanie/data/models/model_bron/model_bron.dart';
import 'package:test_zadanie/data/models/room/rooms_model.dart';
import 'package:test_zadanie/data/models/room_description/room_model.dart';

class Repository3 {
  final dio = Dio();
  Future getData2() async {
    try {
      Response response = await dio
          .get('https://run.mocky.io/v3/e8868481-743f-4eb2-a0d7-2bc4012275c8');

      var body = response.data;

      final bron = BronModel.fromJson(body);

      return bron;
    } catch (e) {
      print(e);
    }
  }
}
