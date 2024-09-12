import 'package:http/http.dart' as http;

final class Appwrite {
  static const serverEndpoint =
      'https://cloud.appwrite.io/v1/databases/main_database/collections/c_id/documents';
  static const headers = {
    'X-Appwrite-Project': projectId,
    'Content-Type': 'application/json',
  };
  static const projectId = '66b20ea5002316ed487f';

  static getDoc() async {
    final doc = await http.get(Uri.parse(serverEndpoint), headers: headers);
    print(doc);
  }
}
