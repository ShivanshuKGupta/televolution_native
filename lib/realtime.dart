import 'dart:js_interop';

import 'package:web/web.dart';

import 'core/utils/js_to_map.dart';

final class AppwriteRealtimeService {
  static void init() {
    console.log('Realtime event listener added in dart!'.toJS);
    window.addEventListener('realtime_event', onRealtimeEvent.toJS);
  }

  static void onRealtimeEvent(Event event) {
    console.log('We got a realtime event in dart!'.toJS);
    if (event is CustomEvent) {
      final data = convertJsObjectToMap(event.detail);
      console.log('realtime_event.detail = $data'.toJS);
    } else {
      console.log('realtime_event = $event'.toJS);
    }
  }
}
