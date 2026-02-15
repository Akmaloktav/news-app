import 'package:flutter/material.dart';
import 'package:news_app/themes/app_textstyle.dart';
import 'package:news_app/widgets/newest_news_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool _isSearching = false;
  bool _hasResult = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios_new),
                  ),
                  Expanded(
                    child: TextField(
                      autofocus: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search_outlined),
                        hintText: "Search About News...",
                        hintStyle: AppTextstyle.getBaseTextTheme.bodyLarge,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: titleResultSearch(),
              ),
              SizedBox(height: 8.0),
              Expanded(
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  child: resultSearch(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListView resultSearch() {
    return ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                  return NewestNewsCard();
                });
  }

  Align titleResultSearch() {
    return Align(
                alignment: Alignment.topLeft,
                child: Text(
                    '"Result of search"',
                    style: AppTextstyle.getBaseTextTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
              );
  }

  Row recentSearchTitle() {
    return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recent Search",
                    style: AppTextstyle.getBaseTextTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Clear All",
                    style: AppTextstyle.getBaseTextTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ],
              );
  }

  // ListView recentSearchMethod() {
  //   return ListView.builder(
  //     itemCount: 3,
  //     itemBuilder: (context, index) {
  //       return Container(
  //         margin: EdgeInsets.only(bottom: 4.0),
  //         decoration: BoxDecoration(
  //           color: Colors.grey,
  //           borderRadius: index == 0
  //               ? BorderRadius.only(
  //                   topLeft: Radius.circular(12),
  //                   topRight: Radius.circular(12),
  //                 )
  //               : (index == 2
  //                     ? BorderRadius.only(
  //                         bottomLeft: Radius.circular(12),
  //                         bottomRight: Radius.circular(12),
  //                       )
  //                     : BorderRadius.zero),
  //         ),
  //         child: Padding(
  //           padding: const EdgeInsets.all(4.0),
  //           child: Row(
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             children: [
  //               Icon(Icons.timelapse_outlined),
  //               SizedBox(width: 8.0),
  //               Expanded(
  //                 child: Text(
  //                   "Lorem Ipsum Dolor amet site",
  //                   style: AppTextstyle.getBaseTextTheme.bodyMedium,
  //                   overflow: TextOverflow.ellipsis,
  //                 ),
  //               ),
  //               SizedBox(width: 8.0),
  //               IconButton(onPressed: () {}, icon: Icon(Icons.clear_outlined)),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  ListView recentSearchMethod() {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.timelapse_outlined),
              SizedBox(width: 8.0),
              Expanded(
                child: Text(
                  "Lorem Ipsum Dolor amet site",
                  style: AppTextstyle.getBaseTextTheme.bodyMedium,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(width: 8.0),
              IconButton(onPressed: () {}, icon: Icon(Icons.clear_outlined)),
            ],
          ),
        );
      },
    );
  }
}
