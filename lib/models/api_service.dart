import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiKey = dotenv.env["API_KEY"] ?? "API Key tidak ditemukan";
  Future<dynamic> get(String path, Map<String, String>? query) async {
    final uri = Uri.https("newsapi.org", path, query);

    final response = await http.get(
      uri,
      headers: {
        "X-Api-Key" : apiKey,
        'Content-Type': 'application/json',
      },
    );

    return jsonDecode(response.body);
  }
}
