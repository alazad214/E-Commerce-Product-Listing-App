import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_product_listing_app/core/constants/app_assets/assets_icons.dart';
import 'package:ecommerce_product_listing_app/core/constants/app_assets/assets_image.dart';
import 'package:ecommerce_product_listing_app/core/constants/app_colors.dart';
import 'package:ecommerce_product_listing_app/core/constants/text_font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCard extends StatelessWidget {
  final String image;
  final String? title;
  final num? price;
  final num? originalPrice;
  final num? rating;
  final num? discountPercentage;
  final num? totalReviews;
  final bool isOutOfStock;
  final VoidCallback? onFavoriteTap;

  const ProductCard({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.originalPrice,
    required this.rating,
    required this.discountPercentage,
    required this.totalReviews,
    this.isOutOfStock = false,
    this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(4),
                ),

                child: CachedNetworkImage(
                  imageUrl: image,
                  height: 164.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder:
                      (context, url) => SizedBox(
                        height: 164.h,
                        child: Center(child: CircularProgressIndicator()),
                      ),
                  errorWidget:
                      (context, url, error) => SizedBox(
                        height: 164.h,
                        child: Image.asset(
                          AssetsImage.placeholder,
                          fit: BoxFit.cover,
                        ),
                      ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: onFavoriteTap,
                  child: Image.asset(AssetsIcons.favourite2),
                ),
              ),
              if (isOutOfStock)
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 6.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.cFF3B30,
                      borderRadius: BorderRadius.circular(2.r),
                    ),
                    child: Text(
                      'Out Of Stock',
                      style: TextFontStyle.headline10w500c1F2937,
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title ?? '',
                  style: TextFontStyle.headline12w400c1F2937,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 6.h),
                Row(
                  children: [
                    Text(
                      '\$$price',
                      style: TextFontStyle.headline14w600c1F2937,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(width: 6.w),
                    if (originalPrice != null)
                      Flexible(
                        child: Text(
                          '\$$originalPrice',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: AppColors.c9CA3AF,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ),
                    if (discountPercentage != null) ...[
                      SizedBox(width: 6.w),
                      Text(
                        overflow: TextOverflow.ellipsis,
                        '${discountPercentage!.toStringAsFixed(0)}% OFF',
                        style: TextFontStyle.headline10w500c1F2937.copyWith(
                          color: AppColors.cEA580C,
                        ),
                      ),
                    ],
                  ],
                ),
                SizedBox(height: 6.h),
                Row(
                  children: [
                    Image.asset(AssetsIcons.rating, height: 16, width: 16),
                    SizedBox(width: 4.w),
                    Text(
                      '${rating?.toStringAsFixed(1)} ',
                      style: TextFontStyle.headline12w500c1F2937,
                    ),
                    Text(
                      '(${totalReviews?.toStringAsFixed(0)})',
                      style: TextFontStyle.headline12w500c1F2937.copyWith(
                        color: AppColors.c6B7280,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
