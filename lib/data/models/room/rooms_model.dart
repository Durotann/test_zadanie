import 'package:json_annotation/json_annotation.dart';

import '../room_description/room_model.dart';
part 'rooms_model.g.dart';

@JsonSerializable()
class Room {
  List<RoomModel> rooms;
  Room({
    required this.rooms,
  });
  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);
  Map<String, dynamic> toJson() => _$RoomToJson(this);
}
