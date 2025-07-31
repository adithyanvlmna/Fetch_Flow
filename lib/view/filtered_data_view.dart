import 'package:fetch_flow/core/app_theme/app_text_styles.dart';
import 'package:fetch_flow/core/utils/app_size.dart';
import 'package:fetch_flow/widgets/common_appbar.dart';
import 'package:flutter/material.dart';

class FilteredDataView extends StatefulWidget {
  static const String routeName = "filteredDataView";
  const FilteredDataView({super.key});

  @override
  State<FilteredDataView> createState() => _FilteredDataViewState();
}

class _FilteredDataViewState extends State<FilteredDataView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(
        istitle: true,
        isDrawer: true,
        title: "News and Blogs",
        onActionPressed: () {
          shoBottomSheet(context);
        },
        actionIcon: Icons.sort,
      ),
    );
  }

  void shoBottomSheet(context) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.vertical(top: Radius.circular(30)),
      ),
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsetsGeometry.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SizedBox(
            width: screenWidth(context, 1),
            height: screenHeight(context, 3),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [Text("Filter to see data",style: AppTextStyles.primaryText,)],
              ),
            ),
          ),
        );
      },
    );
  }
}
