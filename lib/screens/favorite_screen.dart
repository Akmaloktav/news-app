import 'package:flutter/material.dart';
import 'package:news_app/themes/custom_appbar.dart';
import 'package:news_app/widgets/newest_news_card.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomAppbar(),
          SliverToBoxAdapter(child: SizedBox(height: 16.0)),
          SliverPadding(
              padding: EdgeInsets.only(
                left: 8.0,
                bottom: 8.0,
                right: 8.0,
              ),
              sliver: SliverList.builder(
                itemCount: 7,
                itemBuilder: (BuildContext context, int index) {
                  return NewestNewsCard();
                },
              ),
            ),
        ],
      ),
    );
  }
}