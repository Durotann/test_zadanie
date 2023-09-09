import 'package:dio/dio.dart';
import 'package:test_zadanie/data/models/room/rooms_model.dart';
import 'package:test_zadanie/data/models/room_description/room_model.dart';

class Repository2 {
  final dio = Dio();
  Future<List<RoomModel>> getData1() async {
    Response response = await dio
        .get('https://run.mocky.io/v3/f9a38183-6f95-43aa-853a-9c83cbb05ecd');

    var body = response.data;

    final rooms = Room.fromJson(body);

    return rooms.rooms;
  }
}
