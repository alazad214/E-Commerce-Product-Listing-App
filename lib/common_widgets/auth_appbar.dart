import 'package:ecommerce_product_listing_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    required this.title,
    this.onCallBack,
    this.leadingVisible = false,
    this.actions,
    this.centerTitle,
    this.backgroundColor,
  });

  final String title;
  final onCallBack;
  final bool leadingVisible;
  final actions;
  final centerTitle;
  final backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,

      leading:
          leadingVisible
              ? IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: AppColors.cWhite,
                  size: 20,
                ),
              )
              : null,
      backgroundColor: backgroundColor ?? Colors.transparent,
      titleSpacing: leadingVisible ? 0 : 15,
      centerTitle: centerTitle ?? true,
      title: Text(
        title,
        style: TextStyle(
          color: AppColors.cWhite,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
