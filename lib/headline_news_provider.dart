import 'package:flutter/material.dart';
import 'package:news_app/models/articles.dart';
import 'package:news_app/news_exception.dart';
import 'package:news_app/news_repository.dart';

enum ResultState { loading, noData, hasData, error }

class HeadlineNewsProvider extends ChangeNotifier {
  final NewsRepository repository;

  HeadlineNewsProvider({required this.repository});

  ResultState _state = ResultState.noData;
  List<Articles> _articles = [];
  String _message = "";

  ResultState get state => _state;
  List<Articles> get articles => _articles;
  String get message => _message;

  Future<void> headlineNews(String param) async {
    try {
      _state = ResultState.loading;
      notifyListeners();

      final result = await repository.getHeadlineNews(param);
      if (result.isEmpty) {
        _state = ResultState.noData;
        _message = "Berita tidak ditemukan";
      } else {
        _state = ResultState.hasData;
        _articles = result;
      }
    } on NewsException catch (error) {
      _state = ResultState.error;
      _message = error.userMessage;
    } catch (error) {
      _state = ResultState.error;
      _message = error.toString();
    } finally {
      notifyListeners();
    }
  }
}
