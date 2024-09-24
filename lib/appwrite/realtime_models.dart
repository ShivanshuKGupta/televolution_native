import 'appwrite.dart';

extension on List<String> {
  /// Returns the element at the given [index] if it exists, else returns null
  String? getElementIfExists(int index) {
    if (index >= length) return null;
    return this[index];
  }
}

class RealtimeChannel {
  String channel;

  /// Extracts the databaseId from the channel, if available or else returns null
  String? get databaseId => channel.split('.').getElementIfExists(1);

  /// Extracts the collectionId from the channel, if available or else returns null
  String? get collectionId => channel.split('.').getElementIfExists(3);

  /// Extracts the documentId from the channel, if available or else returns null
  String? get documentId => channel.split('.').getElementIfExists(5);

  /// Constructs a [RealtimeChannel] from a [databaseId], [collectionId] and [documentId]
  ///
  /// You can use it to listen to changes of a specific collection/document,
  /// using [RawRealtimeService.addListener]
  RealtimeChannel(
    String databaseId,
    String collectionId,
    String? documentId,
  ) : channel =
            'databases.$databaseId.collections.$collectionId.documents${documentId == null ? '' : '.$documentId'}';

  /// Constructs a [RealtimeChannel] from a raw channel string
  RealtimeChannel.raw(this.channel);
}

class RealtimePayload {
  List<String> events;
  List<RealtimeChannel> channels;
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
        channels = (json['channels'] as List?)
                ?.cast<String>()
                .map((channel) => RealtimeChannel.raw(channel))
                .toList() ??
            [],
        timestamp = DateTime.parse(json['timestamp'].toString()),
        payload = json['payload'];
}

typedef RealtimeListener = void Function(RealtimePayload data);
