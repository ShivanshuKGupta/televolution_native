import '../../appwrite/mustache.dart';

class ModulesActivationModel extends Mustache {
  String title;
  bool enabled;

  ModulesActivationModel({
    required super.$id,
    required this.title,
    required this.enabled,
  });

  @override
  factory ModulesActivationModel.fromJson(Map<String, dynamic> json) {
    return ModulesActivationModel(
      $id: json['\$id'].toString(),
      title: json['title'].toString().interpolate(),
      enabled: bool.tryParse(json['enabled'].toString()) ?? false,
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        '\$id': $id,
        'title': title,
        'enabled': enabled,
      };
}
