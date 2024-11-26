import 'package:flutter/material.dart';
import 'package:news_app_primary/core/colors_manager.dart';
import 'package:news_app_primary/data/api/api_manager/api_manager.dart';
import 'package:news_app_primary/data/api/model/article_response/article.dart';

import 'article_item_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Article> _searchResults = [];

  // This function performs the search
  void _searchArticles(String query) async {
    if (query.isEmpty) {
      setState(() {
        _searchResults = [];
      });
      return;
    }

    // Replace this with the appropriate API method to search articles
    List<Article> articles = await ApiManager.searchArticles(query);

    setState(() {
      _searchResults = articles;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white,
      appBar: AppBar(
        title: const Text('Search Articles'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Search by title, description...',
                border: OutlineInputBorder(),
              ),
              onChanged: _searchArticles,
            ),
          ),
          Expanded(
            child: _searchResults.isEmpty
                ? const Center(child: Text('No articles found'))
                : ListView.builder(
                    itemCount: _searchResults.length,
                    itemBuilder: (context, index) {
                      return ArticleItemWidget(article: _searchResults[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
