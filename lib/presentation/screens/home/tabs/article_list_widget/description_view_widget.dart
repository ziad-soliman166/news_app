import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../config/theme/app_styles.dart';
import '../../../../../core/colors_manager.dart';
import '../../../../../data/api/model/article_response/article.dart';

class DescriptionViewWidget extends StatefulWidget {
  DescriptionViewWidget({super.key, required this.article});

  final Article article;

  @override
  State<DescriptionViewWidget> createState() => _DescriptionViewWidgetState();
}

class _DescriptionViewWidgetState extends State<DescriptionViewWidget> {
  // Function to launch the URL
  Future<void> _launchUrl(String urlString) async {
    final Uri? url = Uri.tryParse(urlString); // Parse the URL safely
    if (url == null || !url.hasScheme || !url.hasAuthority) {
      // Check if the URL has both scheme (http, https) and authority (host)
      throw Exception('Invalid URL: $urlString');
    }

    // Attempt to launch the valid URL
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Check if the image URL is valid before passing to CachedNetworkImage
    String imageUrl = widget.article.urlToImage ?? '';
    if (imageUrl.isEmpty || !Uri.parse(imageUrl).isAbsolute) {
      imageUrl =
          'https://www.example.com/default-image.png'; // Provide a fallback image
    }

    return Scaffold(
      backgroundColor: ColorsManager.white,
      appBar: AppBar(
        title: Text(widget.article.title ?? 'Article Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                      const Center(child: Icon(Icons.error)),
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(widget.article.source?.name ?? '',
                  style: AppStyles.sourceName),
              SizedBox(
                height: 8.h,
              ),
              Text(widget.article.title ?? '', style: AppStyles.articleTitle),
              SizedBox(
                height: 8.h,
              ),
              Text(
                widget.article.publishedAt ?? '',
                textAlign: TextAlign.end,
                style: AppStyles.publishAtTitle,
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                widget.article.description ?? 'No description available.',
                style: AppStyles.articleBody,
              ),
              InkWell(
                onTap: () {
                  // Use the article's URL from the API to navigate
                  String articleUrl = widget.article.url ?? '';
                  if (articleUrl.isNotEmpty) {
                    _launchUrl(articleUrl);
                  } else {
                    // Handle cases where the URL might be empty or null
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text('No URL provided for this article')),
                    );
                  }
                },
                child: Text("View full article",
                    style: TextStyle(color: Colors.blue)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
