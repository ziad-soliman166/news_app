import 'package:flutter/material.dart';
import 'package:news_app_primary/presentation/screens/home/tabs/categories/category_details/widgets/sources_tab_widget/sources_tab_widget.dart';

import '../../../../../../data/api/api_manager/api_manager.dart';
import '../../../../../../data/api/model/sources_response/source.dart';
import '../../../../../../data/api/model/sources_response/source_response.dart';
import '../../../../../../data_model/category_DM.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails({super.key, required this.categoryDM});

  final CategoryDM categoryDM;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse>(
      future: ApiManager.getSources(categoryDM.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(
            child: Text(
              'Error: ${snapshot.error}',
              style: const TextStyle(color: Colors.red),
            ),
          );
        }

        final sourceResponse = snapshot.data;
        if (sourceResponse == null || sourceResponse.sources == null) {
          return const Center(child: Text('No sources found.'));
        }

        List<Source> sources =
            (sourceResponse.sources as List<dynamic>).cast<Source>();

        return SourcesTabWidget(
          sources: sources,
          isSelected: true,
        );
      },
    );
  }
}
