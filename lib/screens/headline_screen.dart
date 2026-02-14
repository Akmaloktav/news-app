import 'package:flutter/material.dart';
import 'package:news_app/themes/app_textstyle.dart';
import 'package:news_app/widgets/custom_appbar.dart';

class HeadlineScreen extends StatefulWidget {
  const HeadlineScreen({super.key});

  @override
  State<HeadlineScreen> createState() => _HeadlineScreenState();
}

class _HeadlineScreenState extends State<HeadlineScreen> {
  final List<String> _selectCategory = [
    'Sport',
    'Art',
    'Music',
    'Religion',
    'History',
    'World',
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
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
          SliverList.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AspectRatio(
                      aspectRatio: 16 / 8,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              "https://upload.wikimedia.org/wikipedia/commons/f/fd/Jisoo_of_Blackpink_at_a_Dior_event%2C_April_18%2C_2025_%283%29.png",
                            ),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Name of publisher',
                      style: AppTextstyle.getBaseTextTheme.bodyMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'News Title',
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
                          'Name of author',
                          style: AppTextstyle.getBaseTextTheme.bodyMedium,
                        ),
                        Text(
                          'Date of publisher',
                          style: AppTextstyle.getBaseTextTheme.bodyMedium,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
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