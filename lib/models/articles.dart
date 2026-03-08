import 'package:news_app/models/source.dart';

class Articles {
  final Source source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  Articles({
    required this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory Articles.fromJson(Map<String, dynamic> jsonData) {
    return Articles(
      source: Source.fromJson(jsonData["source"]),
      author: jsonData["author"],
      title: jsonData["title"],
      description: jsonData["description"],
      url: jsonData["url"],
      urlToImage: jsonData["urlToImage"],
      content: jsonData["content"],
      publishedAt: jsonData["publishedAt"],
    );
  }
}
