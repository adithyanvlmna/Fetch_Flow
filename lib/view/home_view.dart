import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fetch_flow/core/app_theme/app_colors.dart';
import 'package:fetch_flow/core/app_theme/app_text_styles.dart';
import 'package:fetch_flow/core/utils/enum.dart';
import 'package:fetch_flow/core/utils/internet_checker.dart';
import 'package:fetch_flow/providers/items_list_provider.dart';
import 'package:fetch_flow/view/product_view.dart';
import 'package:fetch_flow/widgets/common_appbar.dart';
import 'package:fetch_flow/widgets/custom_card.dart';
import 'package:fetch_flow/widgets/drawer.dart';
import 'package:fetch_flow/widgets/shimmer_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  static const String routeName = "homeView";
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    ItemsListProvider provider = Provider.of<ItemsListProvider>(
      context,
      listen: false,
    );
    WidgetsBinding.instance.addPostFrameCallback((ctx) {
      provider.getProductsFromList();
    });
    super.initState();
  }

  @override
  @override
Widget build(BuildContext context) {
  return Scaffold(
    drawer: CustomDrawer(),
    backgroundColor: whiteColor,
    appBar: CommonAppbar(
      isDrawer: true,
      actionIcon: Icons.shopping_cart_outlined,
      onActionPressed: () {},
    ),
    body: Consumer<ItemsListProvider>(
      builder: (context, provider, child) {
        if (provider.apiCallState == ApiCallState.loadiang) {
          return const HomeScreenShimmer();
        }

        return ConnectivityWrapperWidget(
          child: AnimationLimiter(
            child: RefreshIndicator(
              color: blackColor,
              onRefresh: () => provider.getProductsFromList(),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Discover our exclussive\nproducts",
                        style: AppTextStyles.primaryText,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "In this marketplace, you fill find various\ntechnics in the cheapest price",
                        style: AppTextStyles.greyText,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Align(
                      alignment: Alignment.topLeft,
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            'Products',
                            textStyle: AppTextStyles.secondaryText,
                            speed: const Duration(milliseconds: 100),
                            cursor: '',
                          ),
                        ],
                        totalRepeatCount: 1,
                        isRepeatingAnimation: false,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Expanded used here to make GridView scrollable
                    Expanded(
                      child: GridView.builder(
                        padding: const EdgeInsets.only(top: 10),
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: provider.item.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 0.6,
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          final product = provider.item[index];
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 500),
                            child: SlideAnimation(
                              verticalOffset: 50.0,
                              child: FadeInAnimation(
                                child: CustomCard(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      ProductView.routeName,
                                    );
                                 
                                  },
                                  image: product.thumbnail,
                                  title: product.title,
                                  amount: product.price.toString(),
                                  des: product.description,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ),
  );
}


}
