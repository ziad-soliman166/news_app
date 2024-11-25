import 'package:flutter/material.dart';

import '../../../../../data/api/api_manager/api_manager.dart';
import '../../../../../data/api/model/article_response/article.dart';
import '../../../../../data/api/model/sources_response/source.dart';
import 'article_item_widget.dart';

class ArticleListWidget extends StatelessWidget {
  ArticleListWidget({super.key, required this.source});
  Source source;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getArticles(source.id ?? ''),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError || (snapshot.data?.status == 'Error')) {
          return Text(
            snapshot.error?.toString() ?? 'Check internet connection',
          );
        }
        List<Article> articles = snapshot.data?.articles ?? [];
        return Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) =>
                ArticleItemWidget(article: articles[index]),
            itemCount: articles.length,
          ),
        );
      },
    );
  }
}
