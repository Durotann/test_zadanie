// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_hotel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AboutHotel _$AboutHotelFromJson(Map<String, dynamic> json) => AboutHotel(
      description: json['description'] as String,
      peculiarities: (json['peculiarities'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$AboutHotelToJson(AboutHotel instance) =>
    <String, dynamic>{
      'description': instance.description,
      'peculiarities': instance.peculiarities,
    };
