import 'package:flutter/material.dart';
import 'package:news_app_primary/presentation/screens/home/tabs/categories/categories.dart';
import 'package:news_app_primary/presentation/screens/home/tabs/categories/category_details/category_details.dart';
import 'package:news_app_primary/presentation/screens/home/tabs/settings/settings.dart';

import '../../../core/assets_manager.dart';
import '../../../core/colors_manager.dart';
import '../../../data_model/category_DM.dart';
import 'home_drawer/home_drawer.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedWidget = Categories(onCategoryClicked: onCategoryClicked);
  }

  late Widget selectedWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: ColorsManager.white,
          image: DecorationImage(image: AssetImage(AssetsManager.bgPattern))),
      child: Scaffold(
          appBar: AppBar(
            title: const Text('News App'),
          ),
          drawer: HomeDrawer(
            onMenuItemClicked: onDrawerItemClick,
          ),
          body: selectedWidget),
    );
  }

  void onCategoryClicked(CategoryDM category) {
    selectedWidget = CategoryDetails(
      categoryDM: category,
    );
    setState(() {});
  }

  void onDrawerItemClick(MenuItem item) {
    Navigator.pop(context);
    if (item == MenuItem.categories) {
      selectedWidget = Categories(
        onCategoryClicked: onCategoryClicked,
      );
    } else if (item == MenuItem.settings) {
      selectedWidget = Settings();
    }
    setState(() {});
  }
}
