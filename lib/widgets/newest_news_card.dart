import 'package:flutter/material.dart';
import 'package:news_app/screens/detail_news_screen.dart';
import 'package:news_app/themes/app_textstyle.dart';

class NewestNewsCard extends StatelessWidget {
  final String title;
  final String author;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String sourceName;
  const NewestNewsCard({super.key, required this.title, required this.author, required this.url, required this.urlToImage, required this.publishedAt, required this.sourceName});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(28),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailNewsScreen()),
            );
          },
          child: Container(
            height: size.height * 0.16,
            margin: EdgeInsets.symmetric(vertical: 4.0),
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey[400]!, width: 2),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[700]!,
                            offset: Offset(0, 1),
                            blurRadius: 1,
                            spreadRadius: 0.1,
                          ),
                        ],
                        image: DecorationImage(
                          image: NetworkImage(
                            urlToImage,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: size.height,
                    width: size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            sourceName,
                            style: AppTextstyle.getBaseTextTheme.bodyMedium,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            title,
                            style: AppTextstyle.getBaseTextTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.w600),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Row(
                            children: [
                              Text(
                                author,
                                style: AppTextstyle.getBaseTextTheme.bodyMedium,
                              ),
                              SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  publishedAt,
                                  style:
                                      AppTextstyle.getBaseTextTheme.bodyMedium,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
