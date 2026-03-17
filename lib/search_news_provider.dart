import 'package:flutter/material.dart';
import 'package:news_app/models/articles.dart';
import 'package:news_app/news_exception.dart';
import 'package:news_app/news_repository.dart';

enum ResultState { loading, noData, hasData, error }

class SearchNewsProvider extends ChangeNotifier {
  final NewsRepository repository;

  SearchNewsProvider({required this.repository});

  ResultState _state = ResultState.noData;
  List<Articles> _articles = [];
  String _message = "";

  ResultState get state => _state;
  List<Articles> get articles => _articles;
  String get message => _message;

  Future<void> searchNews(String query) async {
    try {
      _state = ResultState.loading;
      notifyListeners();

      final result = await repository.getSearchNews(query);
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
