import '../../mustache.dart';

part 'app_strings_model.g.dart';

class AppStringsModel extends Mustache {
  Map<String, String> data;

  AppStringsModel({required this.data}) : super($id: data['\$id'].toString());

  @override
  factory AppStringsModel.fromJson(Map<String, dynamic> json) {
    return AppStringsModel(
      data: json.map((key, value) => MapEntry(key, value.toString())),
    );
  }

  @override
  Map<String, dynamic> toJson() => data;

  String operator [](String key) => data[key]?.interpolate() ?? '';
}
