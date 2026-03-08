import 'package:news_app/models/api_response.dart';
import 'package:news_app/models/api_service.dart';
import 'package:news_app/models/articles.dart';
import 'package:news_app/news_exception.dart';

class NewsRepository {
  final ApiService _apiService = ApiService();

  Future<List<Articles>> getBreakingNews() async {
    final Map<String, dynamic> data = await _apiService.get("/v2/everything", {
      "q": "Breaking news",
      "sortBy": "publishedAt",
    });

    final response = ApiResponse.fromJson(data);

    if (response.status == "ok") {
      return response.articles
              ?.where((article) {
                return article.url != null &&
                    article.title != null &&
                    article.urlToImage != null;
              })
              .take(7)
              .toList() ??
          [];
    } else {
      throw NewsException(
        response.code ?? "unknown",
        response.message ?? "Error",
      );
    }
  }

  Future<List<Articles>> getLatestNews() async {
    final Map<String, dynamic> data = await _apiService.get("/v2/everything", {
      "q": "latest OR update OR world OR news",
      "sortBy": "publishedAt",
    });

    final response = ApiResponse.fromJson(data);

    if (response.status == "ok") {
      return response.articles?.where((article) {
            return article.title != null && article.url != null;
          }).toList() ??
          [];
    } else {
      throw NewsException(
        response.code ?? "unknown",
        response.message ?? "Error",
      );
    }
  }
}
