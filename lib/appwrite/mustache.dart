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
String _interpolateString(
  String template, [
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

/// Gets a value from a [dataMap] using a [property] path. \
/// If [dataMap] is null, then [globalData] will be used as [dataMap].
///
/// For example, if the [property] is `a.b.c` and the [dataMap] is
/// ```
/// {'a': {'b': {'c': 'value'}}}
/// ```
/// , the function will return string `value`. And if the [property] is `a.b`,
/// the function will return a [dataMap]
/// ```
/// {'c': 'value'}
/// ```
/// and if the [property] is `a.b.c.d`, the function will return `null`.
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

/// Interpolates the [data] object. \
/// If the [data] is a [String], the function will interpolate the string. \
/// If the [data] is a combined object like a [Map] or a [List], the function
/// will recursively interpolate the object.
T interpolateObject<T>(T data) {
  if (data is String) {
    return _interpolateString(data) as T;
  } else if (data is Map<dynamic, dynamic>) {
    final interpolatedData = <dynamic, dynamic>{};
    data.forEach((key, value) {
      interpolatedData[interpolateObject(key)] = interpolateObject(value);
    });
    return interpolatedData as T;
  } else if (data is List) {
    final interpolatedData = <dynamic>[];
    data.forEach((value) {
      interpolatedData.add(interpolateObject(value));
    });
    return interpolatedData as T;
  }

  return data;
}

extension MustachExtension<T> on T {
  /// Interpolates the object.
  ///
  /// Same as calling [interpolateObject] with the object.
  T interpolate() => interpolateObject(this);
}
