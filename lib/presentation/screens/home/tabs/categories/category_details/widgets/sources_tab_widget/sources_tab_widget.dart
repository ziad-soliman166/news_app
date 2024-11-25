import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../../data/api/model/sources_response/source.dart';
import '../../../../article_list_widget/article_list_widget.dart';
import '../source_item_widget.dart';

class SourcesTabWidget extends StatefulWidget {
  const SourcesTabWidget({
    super.key,
    required this.sources,
    required this.isSelected,
  });

  final List<Source> sources;
  final bool isSelected;

  @override
  State<SourcesTabWidget> createState() => _SourcesTabWidgetState();
}

class _SourcesTabWidgetState extends State<SourcesTabWidget> {
  int tappedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sources.length,
          child: TabBar(
            labelPadding: EdgeInsets.symmetric(horizontal: 8.w),
            onTap: (index) {
              setState(() {
                tappedIndex = index;
              });
            },
            indicatorColor: Colors.transparent,
            dividerColor: Colors.transparent,
            isScrollable: true,
            tabs: widget.sources
                .asMap()
                .entries
                .map(
                  (entry) => SourceItemWidget(
                    source: entry.value,
                    isSelected: tappedIndex == entry.key,
                  ),
                )
                .toList(),
          ),
        ),
        Expanded(
          child: ArticleListWidget(
            source: widget.sources[tappedIndex],
          ),
        ),
      ],
    );
  }
}
