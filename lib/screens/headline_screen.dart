import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/headline_news_provider.dart';
import 'package:news_app/screens/detail_news_screen.dart';
import 'package:news_app/themes/app_textstyle.dart';
import 'package:news_app/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';

class HeadlineScreen extends StatefulWidget {
  const HeadlineScreen({super.key});

  @override
  State<HeadlineScreen> createState() => _HeadlineScreenState();
}

class _HeadlineScreenState extends State<HeadlineScreen> {
  final List<String> _selectCategory = [
    'General',
    'Sports',
    'Business',
    'Entertainment',
    'Health',
    'Science',
    'Technology',
  ];
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (mounted) {
        context.read<HeadlineNewsProvider>().headlineNews(
          _selectCategory[selectedIndex],
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final headlineProvider = context.watch<HeadlineNewsProvider>();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomAppbar(),
          SliverToBoxAdapter(child: SizedBox(height: 16.0)),
          // SliverPersistentHeader(delegate: SliverPersistentHeaderDelegate.),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    _selectCategory.length,
                    (index) => Padding(
                      padding: EdgeInsets.only(right: 12.0),
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        child: ChoiceChip(
                          showCheckmark: false,
                          onSelected: (value) {
                            setState(() {
                              selectedIndex = value ? index : selectedIndex;
                            });
                            context.read<HeadlineNewsProvider>().headlineNews(
                              _selectCategory[selectedIndex],
                            );
                          },
                          label: Text(_selectCategory[index]),
                          selected: selectedIndex == index,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: selectedIndex == index ? 2 : 0,
                          pressElevation: 0,
                          labelPadding: EdgeInsets.symmetric(
                            horizontal: 4,
                            vertical: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 4.0)),
          if (headlineProvider.state == ResultState.loading)
            const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()),
            )
          else if (headlineProvider.state == ResultState.error ||
              headlineProvider.state == ResultState.noData)
            SliverFillRemaining(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error, size: 70),
                    SizedBox(height: 10),
                    Text(
                      headlineProvider.message,
                      maxLines: 2,
                      style: AppTextstyle.getBaseTextTheme.labelMedium
                          ?.copyWith(fontSize: 14),
                    ),
                  ],
                ),
              ),
            )
          else
            SliverList.builder(
              itemCount: headlineProvider.articles.length,
              itemBuilder: (context, index) {
                final newsData = headlineProvider.articles[index];
                DateTime utcDate = DateTime.parse(
                  newsData.publishedAt ?? DateTime.now().toIso8601String(),
                );
                String dateOnly = DateFormat('yyyy-MM-dd').format(utcDate);
                String hourOnly = DateFormat('HH:mm').format(utcDate);
                String dateHour = "$dateOnly $hourOnly";

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
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AspectRatio(
                              aspectRatio: 16 / 8,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(28),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      newsData.urlToImage ??
                                      "https://via.assets.so/img.jpg?w=400&h=300&bg=e5e7eb&text=No+Image+Available&fontSize=24&f=png",
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  errorWidget: (context, url, error) => ClipRRect(
                                    borderRadius: BorderRadius.circular(28),
                                    child: Image.network(
                                      "https://via.assets.so/img.jpg?w=400&h=300&bg=e5e7eb&text=No+Image+Available&fontSize=24&f=png",
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              newsData.source.name ?? "no publisher",
                              style: AppTextstyle.getBaseTextTheme.bodyMedium,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              newsData.title ?? 'Untitled News',
                              style: AppTextstyle.getBaseTextTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.w600),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 4.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  newsData.author ?? 'Anonim',
                                  style:
                                      AppTextstyle.getBaseTextTheme.bodyMedium,
                                ),
                                Text(
                                  dateHour,
                                  style:
                                      AppTextstyle.getBaseTextTheme.bodyMedium,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}

// class CategoryHeaderDelegate extends SliverPersistentHeaderDelegate {
//   final List<String> _selectCategory = [
//     'Sport',
//     'Art',
//     'Music',
//     'Religion',
//     'History',
//     'World',
//   ];
//   int selectedIndex = 0;
//   // CategoryHeaderDelegate(this.selectedIndex);
//   @override
//   Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: List.generate(
//                     _selectCategory.length,
//                     (index) => Padding(
//                       padding: EdgeInsets.only(right: 12.0),
//                       child: AnimatedContainer(
//                         duration: Duration(milliseconds: 300),
//                         curve: Curves.easeInOut,
//                         child: ChoiceChip(
//                           showCheckmark: false,
//                           selected: selectedIndex == index,
//                           onSelected: (value) {
//                             setState(() {
//                               selectedIndex = value ? index : selectedIndex;
//                             });
//                           },
//                           label: Text(_selectCategory[index]),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           elevation: selectedIndex == index ? 2 : 0,
//                           pressElevation: 0,
//                           labelPadding: EdgeInsets.symmetric(
//                             horizontal: 4,
//                             vertical: 1,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//   }

//   @override
//   double get maxExtent => 200.0;

//   @override
//   double get minExtent => kToolbarHeight + 200.0;

//   @override
//   bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;

// }
