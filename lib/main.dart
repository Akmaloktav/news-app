import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app/breaking_news_provider.dart';
import 'package:news_app/headline_news_provider.dart';
import 'package:news_app/latest_news_provider.dart';
import 'package:news_app/news_repository.dart';
import 'package:news_app/screens/main_screen.dart';
import 'package:news_app/search_news_provider.dart';
import 'package:news_app/themes/app_theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await dotenv.load(fileName: ".env");
  } catch (e) {
    throw Exception("Error loading .env file: $e");
  }
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) =>
              BreakingNewsProvider(repository: NewsRepository())
                ..breakingNews(),
        ),
        ChangeNotifierProvider(
          create: (_) =>
              LatestNewsProvider(repository: NewsRepository())
                ..latestUpdatedNews(),
        ),
        ChangeNotifierProvider(
          create: (_) => HeadlineNewsProvider(repository: NewsRepository()),
        ),
        ChangeNotifierProvider(
          create: (_) => SearchNewsProvider(repository: NewsRepository()),
        ),
      ],
      child: const NewsApp(),
    ),
  );
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      home: MainScreen(),
    );
  }
}
