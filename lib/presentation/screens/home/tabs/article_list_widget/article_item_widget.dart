import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/theme/app_styles.dart';
import '../../../../../data/api/model/article_response/article.dart';
import 'description_view_widget.dart';

class ArticleItemWidget extends StatelessWidget {
  ArticleItemWidget({super.key, required this.article});
  Article article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              // Navigate to DescriptionViewWidget when the image is clicked
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DescriptionViewWidget(article: article),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                imageUrl: article.urlToImage ?? '',
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) =>
                    const Center(child: Icon(Icons.error)),
              ),
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
          Text(article.source?.name ?? '', style: AppStyles.sourceName),
          SizedBox(
            height: 4.h,
          ),
          Text(
            article.title ?? '',
            style: AppStyles.articleTitle,
          ),
          SizedBox(
            height: 4.h,
          ),
          Text(article.publishedAt ?? '',
              textAlign: TextAlign.end, style: AppStyles.publishAtTitle),
        ],
      ),
    );
  }
}
