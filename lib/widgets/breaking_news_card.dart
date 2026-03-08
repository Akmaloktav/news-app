import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/breaking_news_provider.dart';
import 'package:news_app/screens/detail_news_screen.dart';
import 'package:news_app/themes/app_textstyle.dart';
import 'package:provider/provider.dart';

class BreakingNewsCard extends StatefulWidget {
  const BreakingNewsCard({super.key});

  @override
  State<BreakingNewsCard> createState() => _BreakingNewsCardState();
}

class _BreakingNewsCardState extends State<BreakingNewsCard> {
  final PageController _pageController = PageController();
  int _currentCard = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Consumer<BreakingNewsProvider>(
      builder: (context, breakingNewsProvider, child) {
        if (breakingNewsProvider.state == ResultState.loading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (breakingNewsProvider.state == ResultState.error ||
            breakingNewsProvider.state == ResultState.noData) {
          return Column(
            children: [
              SizedBox(
                height: size.height * 0.32,
                child: Container(
                  margin: EdgeInsets.only(
                    left: 8.0,
                    right: 8.0,
                    bottom: 8.0,
                    top: 4.0,
                  ),
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black87,
                        offset: Offset(0, 2),
                        blurRadius: 2,
                        spreadRadius: 0.1,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.error, size: 70),
                        SizedBox(height: 10),
                        Text(
                          breakingNewsProvider.message,
                          maxLines: 2,
                          style: AppTextstyle.getBaseTextTheme.labelMedium
                              ?.copyWith(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
            ],
          );
          // return Center(child: Text(breakingNewsProvider.message));
        }

        return Column(
          children: [
            SizedBox(
              height: size.height * 0.32,
              child: PageView.builder(
                itemCount: breakingNewsProvider.articles.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final newsData = breakingNewsProvider.articles[index];
                  DateTime utcDate = DateTime.parse(newsData.publishedAt!);
                  String dateOnly = DateFormat('yyyy-MM-dd').format(utcDate);
                  String hourOnly = DateFormat('HH:mm').format(utcDate);

                  return ClipRRect(
                    borderRadius: BorderRadius.circular(28),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailNewsScreen(),
                            ),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                            left: 8.0,
                            right: 8.0,
                            bottom: 8.0,
                            top: 4.0,
                          ),
                          width: size.width,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                newsData.urlToImage ??
                                    "https://via.assets.so/img.jpg?w=400&h=300&bg=e5e7eb&text=No+Image+Available&fontSize=24&f=png",
                              ),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.45),
                                BlendMode.darken,
                              ),
                            ),
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(28),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black87,
                                offset: Offset(0, 2),
                                blurRadius: 2,
                                spreadRadius: 0.2,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 32.0,
                              bottom: 32.0,
                              right: 24,
                            ),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Flexible(
                                        child: Text(
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          newsData.author ?? "Anonim",
                                          style: AppTextstyle
                                              .getBaseTextTheme
                                              .labelMedium
                                              ?.copyWith(color: Colors.white),
                                        ),
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        "-",
                                        style: AppTextstyle
                                            .getBaseTextTheme
                                            .labelMedium
                                            ?.copyWith(color: Colors.white),
                                      ),
                                      const SizedBox(width: 4),
                                      Expanded(
                                        child: Text(
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          "$dateOnly $hourOnly",
                                          style: AppTextstyle
                                              .getBaseTextTheme
                                              .labelMedium
                                              ?.copyWith(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    newsData.title ?? "Untitled News",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextstyle
                                        .getBaseTextTheme
                                        .titleMedium
                                        ?.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                        ),
                                  ),
                                  Text(
                                    newsData.description ??
                                        "There's no description available for this story. Tap to read the full article.",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextstyle
                                        .getBaseTextTheme
                                        .bodyMedium
                                        ?.copyWith(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                onPageChanged: (index) {
                  setState(() {
                    _currentCard = index;
                  });
                },
              ),
            ),
            SizedBox(
              height: 45,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  breakingNewsProvider.articles.length,
                  (index) => AnimatedContainer(
                    duration: Duration(microseconds: 700),
                    curve: Curves.easeIn,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    height: _currentCard == index ? 12 : 6,
                    width: _currentCard == index ? 24 : 12,
                    decoration: BoxDecoration(
                      color: _currentCard == index
                          ? Theme.of(context).primaryColor
                          : Colors.grey[400],
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
