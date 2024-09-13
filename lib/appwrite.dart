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
