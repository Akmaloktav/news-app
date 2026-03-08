import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/latest_news_provider.dart';
import 'package:news_app/themes/app_textstyle.dart';
import 'package:news_app/widgets/custom_appbar.dart';
import 'package:news_app/widgets/breaking_news_card.dart';
import 'package:news_app/widgets/newest_news_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            CustomAppbar(),
            SliverToBoxAdapter(child: SizedBox(height: 16.0)),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Breaking News',
                  style: AppTextstyle.getBaseTextTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 4.0)),
            SliverPadding(
              padding: EdgeInsets.all(4.0),
              sliver: SliverToBoxAdapter(child: BreakingNewsCard()),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 4.0)),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Latest Update',
                  style: AppTextstyle.getBaseTextTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 4.0)),
            SliverPadding(
              padding: EdgeInsets.only(
                top: 4.0,
                left: 8.0,
                bottom: 8.0,
                right: 8.0,
              ),
              sliver: Consumer<LatestNewsProvider>(
                builder: (context, latestNewsProvider, child) {
                  return SliverList.builder(
                    itemCount: latestNewsProvider.articles.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (latestNewsProvider.state == ResultState.loading) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (latestNewsProvider.state == ResultState.error ||
                          latestNewsProvider.state == ResultState.noData) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.error, size: 70),
                              SizedBox(height: 10),
                              Text(
                                latestNewsProvider.message,
                                maxLines: 2,
                                style: AppTextstyle.getBaseTextTheme.labelMedium
                                    ?.copyWith(fontSize: 14),
                              ),
                            ],
                          ),
                        );
                      }

                      final newsData = latestNewsProvider.articles[index];
                      DateTime utcDate = DateTime.parse(newsData.publishedAt!);
                      String dateOnly = DateFormat(
                        'yyyy-MM-dd',
                      ).format(utcDate);
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
        ),
      ),
    );
  }
}
