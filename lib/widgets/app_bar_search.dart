import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_restaurant_app_example/app/app_colors.dart';

class AppBarSearchBar extends StatelessWidget implements PreferredSizeWidget {
  final double _height = 80.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: AppColors.lightAppBarPink,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.searchBackgroundLightPink,
                borderRadius: BorderRadius.circular(30),
              ),
              margin: EdgeInsets.symmetric(
                vertical: 18,
                horizontal: 40,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 10,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FaIcon(FontAwesomeIcons.search),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: TextField(
                        decoration: InputDecoration.collapsed(
                            hintText: 'Search for dishes'),
                      ),
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

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(_height);
}
