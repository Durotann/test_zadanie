import 'package:json_annotation/json_annotation.dart';

import 'about_hotel_model.dart';
part 'home_screen_model.g.dart';

@JsonSerializable()
class Data {
  int id;
  String name;
  String adress;
  int minimal_price;
  String price_for_it;
  int rating;
  String rating_name;
  List<String> image_urls;
  AboutHotel abouthotel;
  Data(
      {required this.id,
      required this.name,
      required this.adress,
      required this.minimal_price,
      required this.price_for_it,
      required this.rating,
      required this.rating_name,
      required this.image_urls,
      required this.abouthotel});
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}
