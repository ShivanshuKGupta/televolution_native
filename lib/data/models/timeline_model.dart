import '../../mustache.dart';

class TimelineDataModel extends Mustache {
  int day;
  String city;
  String country;
  DateTime createdAt;

  TimelineDataModel({
    required this.day,
    required this.city,
    required this.country,
    required this.createdAt,
    required super.$id,
  });

  @override
  factory TimelineDataModel.fromJson(Map<String, dynamic> json) {
    return TimelineDataModel(
      day: int.tryParse(json['day'].toString()) ?? 0,
      city: json['city'].toString(),
      country: json['country'].toString(),
      createdAt: DateTime.parse(json['created_at'].toString()),
      $id: json['\$id'].toString(),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'city': city,
      'country': country,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
