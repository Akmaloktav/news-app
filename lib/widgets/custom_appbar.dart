import 'package:flutter/material.dart';
import 'package:news_app/themes/app_textstyle.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: Icon(Icons.search_outlined),
      title: Text("News App"),
      centerTitle: true,
      actions: [Icon(Icons.notifications_outlined)],
      actionsPadding: EdgeInsets.all(8.0),
      elevation: 3,
      floating: true,
      snap: true,
      titleTextStyle: AppTextstyle.getBaseTextTheme.titleLarge?.copyWith(
        color: Colors.black,
      ),
    );
  }
}
