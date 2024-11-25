import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/theme/app_styles.dart';
import '../../../../core/colors_manager.dart';
import '../../../../core/strings_manager.dart';

// Define the MenuItem enum
enum MenuItem {
  categories,
  settings,
}

typedef OnMenuItemClicked = void Function(MenuItem);

class HomeDrawer extends StatelessWidget {
  HomeDrawer({super.key, required this.onMenuItemClicked});

  final OnMenuItemClicked onMenuItemClicked;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 110.h,
            color: ColorsManager.green,
            child: Text(
              StringsManager.drawerTitle,
              style: AppStyles.drawerTitle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                buildDrawerItem(
                  icon: Icons.list,
                  text: StringsManager.categories,
                  onClicked: onMenuItemClicked,
                  item: MenuItem.categories,
                ),
                SizedBox(
                  height: 12.h,
                ),
                buildDrawerItem(
                  icon: Icons.settings,
                  text: StringsManager.settings,
                  onClicked: onMenuItemClicked,
                  item: MenuItem.settings,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildDrawerItem({
    IconData? icon,
    required String text,
    required MenuItem item,
    required OnMenuItemClicked onClicked,
  }) {
    return InkWell(
      onTap: () {
        onClicked(item); // Correct item is passed here
      },
      child: Row(
        children: [
          Icon(icon),
          SizedBox(
            width: 8.w,
          ),
          Text(
            text,
            style: AppStyles.categories,
          ),
        ],
      ),
    );
  }
}
