import 'package:fetch_flow/core/utils/app_size.dart';
import 'package:fetch_flow/widgets/common_shimmer.dart';
import 'package:flutter/material.dart';

class HomeScreenShimmer extends StatelessWidget {
  const HomeScreenShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerWidget(
            height: screenHeight(context, 40),
            width: screenWidth(context, 1.5),
            borderRadius: 8,
          ),
          const SizedBox(height: 12),
          ShimmerWidget(
            height: screenHeight(context, 50),
            width: screenWidth(context, 2),
            borderRadius: 8,
          ),
          const SizedBox(height: 16),

         
          Expanded(
            child: GridView.builder(
              itemCount: 6,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemBuilder: (context, index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerWidget(
                    height: screenHeight(context, 6),
                    width: screenWidth(context, 2.4),
                    borderRadius: 12,
                  ),
                  const SizedBox(height: 8),
                  ShimmerWidget(
                    height: screenHeight(context, 60),
                    width: screenWidth(context, 2.4),
                    borderRadius: 8,
                  ),
                  const SizedBox(height: 4),
                  ShimmerWidget(
                    height: screenHeight(context, 80),
                    width: screenWidth(context, 3),
                    borderRadius: 8,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
