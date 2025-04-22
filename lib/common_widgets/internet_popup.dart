import 'package:ecommerce_product_listing_app/core/constants/app_colors.dart';
import 'package:ecommerce_product_listing_app/core/constants/text_font_style.dart';
import 'package:ecommerce_product_listing_app/helpers/ui_helper.dart';
import 'package:flutter/material.dart';

void internetPopup(
  BuildContext context,
  VoidCallback onRetry,
  VoidCallback onOfflineMode,
) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Container(
          height: 350,
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.wifi_off, color: Colors.red, size: 40),
              UIHelper.verticalSpace(5),
              Text('Whoops!', style: TextFontStyle.headline16w600c1F2937),
              UIHelper.verticalSpace(10),
              Text(
                'No Internet Connection found. \nCheck your connection & try again.',
                style: TextFontStyle.headline12w400c1F2937,
                textAlign: TextAlign.center,
              ),
              UIHelper.verticalSpace(10),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  onRetry();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Retry',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              UIHelper.verticalSpace(10),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  onOfflineMode();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Go Offline',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
