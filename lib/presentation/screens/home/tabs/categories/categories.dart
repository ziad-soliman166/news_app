import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/theme/app_styles.dart';
import '../../../../../data_model/category_DM.dart';
import 'category_widget/category_widget.dart';

typedef OnCategoryClicked = void Function(CategoryDM category);

class Categories extends StatelessWidget {
  Categories({super.key, required this.onCategoryClicked});

  final OnCategoryClicked onCategoryClicked;
  final List<CategoryDM> categoriesList = CategoryDM.getAllCategories();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(12),
      child: Column(
        children: [
          Text(
            'Pick your category\nof interest',
            style: AppStyles.pickCategory,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 25,
                crossAxisSpacing: 20,
              ),
              itemCount: categoriesList.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  onCategoryClicked(categoriesList[index]);
                },
                child: CategoryWidget(
                    categoryDM: categoriesList[index], index: index),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
