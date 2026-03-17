import 'package:flutter/material.dart';
import 'package:news_app/themes/app_textstyle.dart';

class RecentSearch extends StatelessWidget {
  const RecentSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16.0),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
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
          ),
        ),
        Expanded(
          child: ListView.builder(
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
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.clear_outlined),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
