import 'package:fetch_flow/core/app_theme/app_colors.dart';
import 'package:fetch_flow/core/app_theme/app_text_styles.dart';
import 'package:fetch_flow/core/utils/app_size.dart';
import 'package:fetch_flow/core/utils/internet_checker.dart';
import 'package:fetch_flow/providers/items_list_provider.dart';
import 'package:fetch_flow/view/update_view.dart';
import 'package:fetch_flow/widgets/common_appbar.dart';
import 'package:fetch_flow/widgets/common_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ProductView extends StatefulWidget {
  static const String routeName = "productView";
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  String currectValue = "Full specification";
  bool isDescription = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return true;
      },
      child: Scaffold(
        backgroundColor: blackColor,
        appBar: CommonAppbar(
          leadingIcon: Icons.arrow_back_ios,
          onLeadingPressed: () {
            Navigator.pop(context);
          },
        ),
        body: ConnectivityWrapperWidget(
          child: Consumer<ItemsListProvider>(
            builder: (context, value, child) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: const BorderRadius.vertical(
                            bottom: Radius.circular(30),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    "https://plus.unsplash.com/premium_photo-1679913792906-13ccc5c84d44?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cHJvZHVjdHxlbnwwfHwwfHx8MA%3D%3D",
                                  ),
                                  backgroundColor: blackColor,
                                  radius: 120,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  Text(
                                    "\$ 229",
                                    style: AppTextStyles.largeBlueText,
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                        context,
                                        UpdateProductScreen.routeName,
                                      );
                                    },
                                    icon: const Icon(Icons.edit, color: Colors.blue),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "Boat",
                                style: AppTextStyles.primaryText,
                              ),
                              Text(
                                "About the item",
                                style: AppTextStyles.greyText,
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  button("Full specification", 130),
                                  const SizedBox(width: 10),
                                  button("Review", 60),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text(
                                isDescription
                                    ? "Read customer reviews to see what others think before making your purchase"
                                    : "View the complete specifications of the product to understand its features, dimensions, and technical details",
                                style: AppTextStyles.normalText,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      CommonButton(
                        onPressed: () {
                          // value.getProductsFromList();
                        },
                        text: "Add To Cart",
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget button(String text, double width) {
    final isChange = currectValue == text;
    return GestureDetector(
      onTap: () {
        setState(() {
          currectValue = text;
          isDescription = (text == "Review");
        });
      },
      child: Container(
        width: width,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isChange ? lightBlue : whiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: blackColor,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
