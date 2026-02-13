import 'package:flutter/material.dart';
import 'package:news_app/themes/app_textstyle.dart';

class NewestNewsCard extends StatelessWidget {
  const NewestNewsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.16,
      margin: EdgeInsets.symmetric(vertical: 4.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[400]!, width: 2)),
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
                      "https://upload.wikimedia.org/wikipedia/commons/f/fd/Jisoo_of_Blackpink_at_a_Dior_event%2C_April_18%2C_2025_%283%29.png",
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
                      'Name of publisher',
                      style: AppTextstyle.getBaseTextTheme.bodyMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'News Title',
                      style: AppTextstyle.getBaseTextTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.w600),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: [
                        Text(
                          'Name of author',
                          style: AppTextstyle.getBaseTextTheme.bodyMedium,
                        ),
                        SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            'Date of publisher',
                            style: AppTextstyle.getBaseTextTheme.bodyMedium,
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
    );
  }
}
