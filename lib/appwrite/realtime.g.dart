part of 'appwrite.dart';

abstract class RawRealtimeService {
  /// Static Variables
  static final Map<String, List<RealtimeListener>> _listeners = {};

  /// Static Methods
  static void init() =>
      window.addEventListener('realtime_event', _onRealtimeEvent.toJS);

  static void _onRealtimeEvent(Event event) {
    console.log('We got a realtime event in dart!'.toJS);
    if (event is CustomEvent) {
      final payload =
          RealtimePayload.fromJson(convertJsObjectToMap(event.detail));
      console.log('realtime_event.detail = $payload'.toJS);

      for (final channel in payload.channels) {
        _listeners[channel]?.forEach((listener) => listener(payload));
      }
    } else {
      console.log('realtime_event = $event'.toJS);
      console.error(
          'Realtime Event was not of type CustomEvent, no listener will be called!!!'
              .toJS);
    }
  }

  /// Adds a listener for the channel
  static void addListener(String channel, RealtimeListener callback) {
    _listeners[channel] ??= [];
    _listeners[channel]!.add(callback);
  }

  /// Removes a listener for the channel
  static void removeListener(String channel, RealtimeListener callback) {
    _listeners[channel]?.remove(callback);
    if (_listeners[channel]?.isEmpty == true) _listeners.remove(channel);
  }
}
