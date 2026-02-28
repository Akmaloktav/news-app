import 'package:news_app/models/articles.dart';

class ApiResponse {
  final String status;
  final int? totalResults;
  final List<Articles>? articles;
  final String? code;
  final String? message;

  ApiResponse({
    required this.status,
    this.totalResults,
    this.articles,
    this.code,
    this.message,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> jsonData) {
    if (jsonData["status"] == "ok") {
      return ApiResponse(
        status: "ok",
        totalResults: jsonData["totalResults"],
        articles: (jsonData["totalResults"] as List?)
            ?.map((item) => Articles.fromJson(jsonData))
            .toList(),
      );
    } else {
      return ApiResponse(
        status: "error",
        code: jsonData["code"],
        message: jsonData["message"],
      );
    }
  }
}
