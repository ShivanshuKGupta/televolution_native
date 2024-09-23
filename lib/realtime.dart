@JS()
library realtime_js;

import 'dart:js_interop';
import 'dart:js_util' as js_util;

import 'package:js/js.dart';
import 'package:web/web.dart';

final class AppwriteRealtimeService {
  AppwriteRealtimeService._() {
    init();
  }

  static final instance = AppwriteRealtimeService._();

  static void init() {
    print("Realtime event listener added in dart!");
    window.addEventListener('realtime_event', onRealtimeEvent.toJS);
  }

  static void onRealtimeEvent(Event event) {
    print('We got a realtime event in dart!');
    if (event is CustomEvent) {
      final data = convertJsObjectToMap(event.detail!);
      print("realtime_event.detail = $data");
    } else {
      print("realtime_event = $event");
    }
  }
}

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
        print("WARNING: Error in converting js object to map at key($key): $e");
      }
    }
  }

  return result;
}
