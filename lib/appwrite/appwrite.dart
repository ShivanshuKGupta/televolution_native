import 'dart:js_interop';

import 'package:dart_appwrite/dart_appwrite.dart' as dart_appwrite;
import 'package:web/web.dart';

import '../core/utils/js_to_map.dart';
import 'realtime_models.dart';

part 'realtime.g.dart';

class AppwriteClient {
  static const String endPoint =
      'https://7xwrgbhq-80.inc1.devtunnels.ms/v1'; // https://cloud.appwrite.io/v1
  static const String projectId = 'televolution'; // 66b20ea5002316ed487f

  /// The Main Database ID
  static const String dbId = 'lite-db';

  /// The Collections
  static const String itinerary = 'itinerary';
  static const String paxInfo = 'pax_info';
  static const String moduleActivation = 'module_activation';
  static const String appStrings = 'app_strings';
  static const String passenger = 'passenger';
  static const String person = 'Person';
  static const String sysarticles = 'sysarticles';
  static const String transaction = 'Transaction';

  AppwriteClient._();

  static final client = dart_appwrite.Client()
    ..setEndpoint(endPoint)
    ..setProject(projectId)
    ..setSelfSigned();

  static final account = dart_appwrite.Account(client);
  static final database = dart_appwrite.Databases(client);
  static final storage = dart_appwrite.Storage(client);
}
