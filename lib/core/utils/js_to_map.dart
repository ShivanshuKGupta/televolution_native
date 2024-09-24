// ignore_for_file: avoid_dynamic_calls

import 'dart:js_interop';
import 'dart:js_util' as js_util;

import 'package:web/web.dart';

Map<String, dynamic> convertJsObjectToMap(JSAny? jsObject) {
  if (jsObject == null) {
    return {};
  }

  Map<String, dynamic> result = {};
  final keys = js_util.objectKeys(jsObject).map((key) => key.toString());

  for (final key in keys) {
    result[key] = js_util.getProperty(jsObject, key);
    if (result[key].runtimeType.toString().contains('Object')) {
      try {
        result[key] = convertJsObjectToMap(result[key]);
      } catch (e) {
        console.warn(
            'WARNING: Error in converting js object to map at key($key): $e'
                .toJS);
      }
    }
  }

  return result;
}
