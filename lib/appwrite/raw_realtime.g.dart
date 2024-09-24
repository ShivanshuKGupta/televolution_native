part of 'appwrite.dart';

abstract class RawRealtimeService {
  static final Map<String, List<RealtimeListener>> _listeners = {};

  /// Initializes the Realtime Service
  static void init() =>
      window.addEventListener('realtime_event', _onRealtimeEvent.toJS);

  /// Trgiggered when a realtime event is received
  static void _onRealtimeEvent(Event event) {
    if (event is CustomEvent) {
      final payload =
          RealtimePayload.fromJson(convertJsObjectToMap(event.detail));
      console.log('[dart] realtime_event.detail = $payload'.toJS);

      for (final realtimeChannel in payload.channels) {
        _listeners[realtimeChannel.channel]
            ?.forEach((listener) => listener(payload));
      }
    } else {
      console.log('[dart] realtime_event = $event'.toJS);
      console.error(
          'Realtime Event was not of type CustomEvent, no listener will be called!!!'
              .toJS);
    }
  }

  /// Adds a listener for changes to channel
  static void addListener(
    RealtimeChannel realtimeChannel,
    RealtimeListener callback,
  ) {
    _listeners[realtimeChannel.channel] ??= [];
    _listeners[realtimeChannel.channel]!.add(callback);
  }

  /// Removes a listener for changes to channel
  static void removeListener(
    RealtimeChannel realtimeChannel,
    RealtimeListener callback,
  ) {
    _listeners[realtimeChannel.channel]?.remove(callback);
    if (_listeners[realtimeChannel.channel]?.isEmpty == true) {
      _listeners.remove(realtimeChannel.channel);
    }
  }
}
