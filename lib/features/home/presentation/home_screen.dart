import 'package:ecommerce_product_listing_app/common_widgets/custom_textfeild.dart';
import 'package:ecommerce_product_listing_app/core/constants/app_assets/assets_icons.dart';
import 'package:ecommerce_product_listing_app/core/constants/app_colors.dart';
import 'package:ecommerce_product_listing_app/features/home/presentation/widgets/shimmer_widget.dart';
import 'package:ecommerce_product_listing_app/features/home/providers/faverotie_provider.dart';
import 'package:ecommerce_product_listing_app/features/home/providers/products_provider.dart';
import 'package:ecommerce_product_listing_app/helpers/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'widgets/product_card.dart';
import 'widgets/build_short_bottom_sheet.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    ref.read(productProvider.notifier).fetchInitialProducts();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 100) {
        ref.read(productProvider.notifier).fetchMoreProducts();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final products = ref.watch(productProvider);
    final isLoading = products.isEmpty;
    isFav(String productId) =>
        ref.watch(favoriteProvider.select((fav) => fav[productId] ?? false));

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          padding: EdgeInsets.all(UIHelper.defaultPadding()),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomTextfield(
                      hintText: 'Search Anything...',
                      onChanged: (value) {
                        ref
                            .read(productProvider.notifier)
                            .searchProducts(value);
                      },
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(AssetsIcons.search, height: 10),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.filter_list,
                      size: 40,
                      color: AppColors.c1F2937,
                    ),
                    onPressed:
                        () => buildShortBottomSheet(
                          context,
                          lowToHighOntap: () {
                            ref
                                .read(productProvider.notifier)
                                .sortByLowToHigh();
                            Navigator.pop(context);
                          },
                          highToLowOntap: () {
                            ref
                                .read(productProvider.notifier)
                                .sortByHighToLow();
                            Navigator.pop(context);
                          },
                          ratingOntap: () {
                            ref.read(productProvider.notifier).sortByRating();
                            Navigator.pop(context);
                          },
                        ),
                  ),
                ],
              ),

              UIHelper.verticalSpace(20),

              GridView.builder(
                itemCount: isLoading ? 6 : products.length,
                shrinkWrap: true,
                primary: false,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.5,
                ),
                itemBuilder: (context, index) {
                  if (isLoading) {
                    return const ShimmerProductCard();
                  }

                  final product = products[index];
                  return ProductCard(
                    image: product.thumbnail ?? '',
                    title: product.title ?? '',
                    price: product.price?.toDouble() ?? 0,
                    originalPrice: (product.price! * 1.2).toDouble(),
                    rating: product.rating,
                    discountPercentage: product.discountPercentage ?? 0.0,
                    totalReviews: 0,
                    isOutOfStock: product.stock == 0,
                    isFavorite: isFav(product.id?.toString() ?? ''),
                    onFavoriteTap: () {
                      ref
                          .read(favoriteProvider.notifier)
                          .toggleFavorite(product.id!);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
