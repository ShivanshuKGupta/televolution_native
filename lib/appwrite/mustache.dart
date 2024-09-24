import '../core/utils/log_extension.dart';
import '../globals.dart';

/// A class that provides a way to convert an object to a JSON object.
/// The JSON object can be used to interpolate the object in a template.
abstract class Mustache {
  String $id;

  Mustache({required this.$id});

  /// Converts the object to a JSON object.
  Map<String, dynamic> toJson();

  /// Converts the JSON object to an object.
  Mustache.fromJson(Map<String, dynamic> json, this.$id);

  @override
  String toString() {
    return toJson().toString();
  }
}

/// Interpolates a template string with values from a map.
String interpolateString(
  /// The template string to interpolate.
  String template, [
  /// The values to interpolate.
  Map<String, dynamic>? values,
]) {
  values ??= globalData;

  return template.replaceAllMapped(RegExp(r'\{\{(.*?)\}\}'), (match) {
    final String key = (match.group(1) ?? '').trim();
    final dynamic value = _getValue(key, values!);

    if (value == null) {
      printLog('WARNING: interpolate: $key not found');
      return '';
    }

    return value.toString();
  });
}

/// Gets a value from a map using a property path.
dynamic _getValue(String property, Map<String, dynamic> dataMap) {
  final List<String> parts = property.split('.');
  Map<String, dynamic> data = dataMap;

  int n = parts.length;
  for (int i = 0; i < n - 1; ++i) {
    String key = parts[i];
    if (!data.containsKey(key)) return null;
    dynamic value = data[key];
    if (value is Map<String, dynamic>) {
      data = value;
    } else if (value is Mustache) {
      data = value.toJson();
    } else {
      printLog('WARNING: getValue: $property: $key is not a Map');
      return data[key];
    }
  }

  return data[parts.last];
}

extension MustacheExtension on String {
  /// Interpolates the string using the global data.
  String interpolate() => interpolateString(this);
}

Map<String, dynamic> interpolateMap(Map<String, dynamic> mapData) {
  return mapData.map(
    (key, value) {
      if (value is String) {
        return MapEntry(key, interpolateString(value));
      }
      if (value is Map<String, dynamic>) {
        return MapEntry(key, interpolateMap(value));
      }
      return MapEntry(key, value);
    },
  );
}
