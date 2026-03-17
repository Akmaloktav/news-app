import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/search_news_provider.dart';
import 'package:news_app/themes/app_textstyle.dart';
import 'package:news_app/widgets/newest_news_card.dart';
import 'package:provider/provider.dart';

class ResultSearch extends StatelessWidget {
  final String query;
  const ResultSearch({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16.0),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              '"$query"',
              style: AppTextstyle.getBaseTextTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
                color: Colors.black,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ),
        SizedBox(height: 8.0),
        Expanded(
          child: Consumer<SearchNewsProvider>(
            builder: (context, searchNewsProvider, child) {
              if (searchNewsProvider.state == ResultState.loading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (searchNewsProvider.state == ResultState.error ||
                  searchNewsProvider.state == ResultState.noData) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.error, size: 70),
                      SizedBox(height: 10),
                      Text(
                        searchNewsProvider.message,
                        maxLines: 2,
                        style: AppTextstyle.getBaseTextTheme.labelMedium
                            ?.copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                );
              }

              return ListView.builder(
                itemCount: searchNewsProvider.articles.length,
                itemBuilder: (context, index) {
                  final newsData = searchNewsProvider.articles[index];
                  DateTime utcDate = DateTime.parse(newsData.publishedAt!);
                  String dateOnly = DateFormat('yyyy-MM-dd').format(utcDate);
                  String hourOnly = DateFormat('HH:mm').format(utcDate);
                  String dateHour = "$dateOnly $hourOnly";

                  return NewestNewsCard(
                    title: newsData.title ?? "Untitled News",
                    author: newsData.author ?? "Anonim",
                    url: newsData.url!,
                    urlToImage:
                        newsData.urlToImage ??
                        "https://via.assets.so/img.jpg?w=400&h=300&bg=e5e7eb&text=No+Image+Available&fontSize=24&f=png",
                    publishedAt: dateHour,
                    sourceName: newsData.source.name ?? "no publisher",
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
