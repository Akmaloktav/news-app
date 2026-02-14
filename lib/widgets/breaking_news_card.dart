import 'package:flutter/material.dart';
import 'package:news_app/models/event_model.dart';
import 'package:news_app/screens/detail_news_screen.dart';
import 'package:news_app/themes/app_textstyle.dart';

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

    return Column(
      children: [
        SizedBox(
          height: size.height * 0.32,
          child: PageView.builder(
            itemCount: findRecommended.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final EventModel eventModel = findRecommended[index];

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
                          image: NetworkImage(eventModel.imageAsset),
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
                            blurRadius: 5,
                            spreadRadius: 0.3,
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
                                  Text(
                                    eventModel.location,
                                    style: AppTextstyle
                                        .getBaseTextTheme
                                        .labelMedium,
                                  ),
                                  Expanded(
                                    child: Text(
                                      eventModel.category,
                                      style: AppTextstyle
                                          .getBaseTextTheme
                                          .labelMedium,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                eventModel.title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextstyle.getBaseTextTheme.titleMedium
                                    ?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    ),
                              ),
                              Text(
                                eventModel.description,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextstyle.getBaseTextTheme.bodyMedium
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
              findRecommended.length,
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
  }
}
