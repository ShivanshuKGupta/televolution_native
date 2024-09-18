import 'package:dart_appwrite/dart_appwrite.dart';
import 'package:http/http.dart' as http;

final class Appwrite {
  static const serverEndpoint = 'https://cloud.appwrite.io/v1';
  static const headers = {
    'X-Appwrite-Project': projectId,
    'Content-Type': 'application/json',
  };
  static const projectId = '66b20ea5002316ed487f';

  static Future<dynamic> listDocument({
    String databaseId = "main_database",
    required String collectionId,
    required String docId,
  }) async {
    final doc = await http.get(
      Uri.parse(
          "$serverEndpoint/databases/$databaseId/collections/$collectionId/documents/$docId"),
      headers: headers,
    );
    print(doc);
  }

  static Future<dynamic> listDocuments({
    String databaseId = "main_database",
    required String collectionId,
  }) async {
    final doc = await http.get(
      Uri.parse(
          "$serverEndpoint/databases/$databaseId/collections/$collectionId/documents"),
      headers: headers,
    );
    print(doc);
  }
}

class AppwriteClient {
  static const String endPoint = 'https://7xwrgbhq-80.inc1.devtunnels.ms/v1';
  static const String projectId = 'televolution';

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

  static final client = Client()
    ..setEndpoint(endPoint)
    ..setProject(projectId)
    ..setSelfSigned();

  static final account = Account(client);
  static final database = Databases(client);
  static final storage = Storage(client);
}
