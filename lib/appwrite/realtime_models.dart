typedef RealtimeListener = void Function(RealtimePayload data);

class RealtimePayload {
  List<String> events;
  List<String> channels;
  DateTime timestamp;
  Map<String, dynamic> payload;

  RealtimePayload({
    required this.events,
    required this.channels,
    required this.timestamp,
    required this.payload,
  });

  RealtimePayload.fromJson(Map<String, dynamic> json)
      : events = (json['events'] as List?)?.cast<String>() ?? [],
        channels = (json['channels'] as List?)?.cast<String>() ?? [],
        timestamp = DateTime.parse(json['timestamp'].toString()),
        payload = json['payload'];
}
