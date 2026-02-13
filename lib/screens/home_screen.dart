import 'package:flutter/material.dart';
import 'package:news_app/themes/app_textstyle.dart';
import 'package:news_app/themes/custom_appbar.dart';
import 'package:news_app/widgets/breaking_news_card.dart';
import 'package:news_app/widgets/newest_news_card.dart';

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
              sliver: SliverList.builder(
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return NewestNewsCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
