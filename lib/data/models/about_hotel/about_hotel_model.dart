import 'package:json_annotation/json_annotation.dart';

part 'about_hotel_model.g.dart';

@JsonSerializable()
class AboutHotel {
  String description;
  List<String> peculiarities;
  AboutHotel({
    required this.description,
    required this.peculiarities,
  });
  factory AboutHotel.fromJson(Map<String, dynamic> json) =>
      _$AboutHotelFromJson(json);

  Map<String, dynamic> toJson() => _$AboutHotelToJson(this);
}
