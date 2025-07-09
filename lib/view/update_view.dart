import 'package:fetch_flow/core/app_theme/app_colors.dart';
import 'package:fetch_flow/providers/items_list_provider.dart';
import 'package:fetch_flow/widgets/common_appbar.dart';
import 'package:fetch_flow/widgets/common_button.dart';
import 'package:fetch_flow/widgets/common_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class UpdateProductScreen extends StatefulWidget {
  static const String routeName = "updateProductScreen";
  const UpdateProductScreen({super.key});

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {


  final _formKey = GlobalKey<FormState>();

  void _onUpdate() {
    if (_formKey.currentState!.validate()) {
      // Perform update logic
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Product updated successfully!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemsListProvider>(
      builder: (context,value,child) {
        return Scaffold(
          backgroundColor: whiteColor,
          appBar: CommonAppbar(
            istitle: true,
            title: "Update Screen",
            leadingIcon: Icons.arrow_back_ios,onLeadingPressed: (){
            Navigator.pop(context);
          },),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: value.formKey,
              child: Column(
                children: [
                  CommonTextField(
                    controller: value.titleController,
                    hintText: 'Product Title',
                    prefixIcon: Icons.title,
                    validator: (value) =>
                        value == null || value.isEmpty ? 'Enter title' : null,
                  ),
                  const SizedBox(height: 20),
                  CommonTextField(
                    controller:value.priceController,
                    hintText: 'Price',
                    keyboardType: TextInputType.number,
                    prefixIcon: Icons.attach_money,
                    validator: (value) =>
                        value == null || value.isEmpty ? 'Enter price' : null,
                  ),
                  const SizedBox(height: 20),
                  CommonTextField(
                    controller: value.descriptionController,
                    hintText: 'Description',
                    maxLines: 5,
                    prefixIcon: Icons.description,
                    validator: (value) =>
                        value == null || value.isEmpty ? 'Enter description' : null,
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child:CommonButton(onPressed: (){
                     if( value.formKey.currentState!.validate()){

                     }
                    }, text: "Update",isBlack: true,)
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
