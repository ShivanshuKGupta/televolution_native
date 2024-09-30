import 'dart:async';
import 'dart:js_interop';

import 'package:web/web.dart';

import '../core/services/retry.dart';
import 'appwrite.dart';
import 'mustache.dart';
import 'realtime_models.dart';

class ModelStream<S extends Mustache> {
  final String databaseId;
  final String collectionId;
  final S Function(Map<String, dynamic> json) convert;

  List<S> _data = [];
  StreamController<List<S>>? _controller;

  ModelStream({
    required this.databaseId,
    required this.collectionId,
    required this.convert,
  });

  Stream<List<S>> get stream {
    _controller ??= StreamController<List<S>>.broadcast(onListen: _startStream);
    return _controller!.stream;
  }

  late final RealtimeChannel realtimeChannel =
      RealtimeChannel(databaseId, collectionId, null);

  void _startStream() async {
    RawRealtimeService.addListener(realtimeChannel, _onData);
    final data = await retry(() => AppwriteClient.database
        .listDocuments(databaseId: databaseId, collectionId: collectionId));
    _data = data.documents.map((doc) => convert(doc.data)).toList();
    console.log('Intial data fetch for $collectionId: $_data'.toJS);
    _notifyListeners();
  }

  void dispose() {
    _controller?.close();
    RawRealtimeService.removeListener(realtimeChannel, _onData);
  }

  void _notifyListeners() {
    _controller?.addStream(Stream.fromIterable([_data]));
  }

  void _onData(RealtimePayload data) {
    final changedS = convert(data.payload);
    final deleted = data.events.fold(
      false,
      (previousValue, element) => previousValue || element.contains('delete'),
    );
    final index = _data.indexWhere((element) => element.$id == changedS.$id);
    if (index == -1) {
      _data.add(changedS);
    } else {
      if (deleted) {
        _data.removeAt(index);
      } else {
        _data[index] = changedS;
      }
    }
    _notifyListeners();
  }
}
