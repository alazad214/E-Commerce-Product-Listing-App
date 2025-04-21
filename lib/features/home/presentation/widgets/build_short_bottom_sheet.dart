  import 'package:ecommerce_product_listing_app/core/constants/text_font_style.dart';
import 'package:ecommerce_product_listing_app/helpers/ui_helper.dart';
import 'package:flutter/material.dart';

void buildShortBottomSheet(
    BuildContext context, {
    highToLowOntap,
    lowToHighOntap,
    ratingOntap,
  }) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(UIHelper.defaultPadding()),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Sort By', style: TextFontStyle.headline16w600c1F2937),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),

              ListTile(
                onTap: highToLowOntap,
                title: Text(
                  'Price - High to Low',
                  style: TextFontStyle.headline14w400c1F2937,
                ),
              ),
              ListTile(
                onTap: lowToHighOntap,
                title: Text(
                  'Price - Low to High',
                  style: TextFontStyle.headline14w400c1F2937,
                ),
              ),
              ListTile(
                onTap: ratingOntap,
                title: Text(
                  'Rating',
                  style: TextFontStyle.headline14w400c1F2937,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
