import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiEndpoint {
  final apiUrl =
      "https://opentdb.com/api.php?amount=10&category=18&difficulty=hard&type=multiple";

  Future<Map<String, dynamic>> fetchData() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final parsedData = json.decode(response.body);
      return parsedData;
    } else {
      throw Exception('Failed to fetch data from the API');
    }
  }
}
