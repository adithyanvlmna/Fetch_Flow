// ignore_for_file: avoid_print, prefer_final_fields

import 'package:fetch_flow/core/utils/api_url.dart';
import 'package:fetch_flow/core/utils/enum.dart';
import 'package:fetch_flow/model/items.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class ItemsListProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final priceController = TextEditingController();
  final descriptionController = TextEditingController();
  ApiCallState _apiCallState = ApiCallState.noState;
  ApiCallState get apiCallState => _apiCallState;
  List<Product> item = [];
  bool isLoad = false;

  setApiState(ApiCallState newState) {
    _apiCallState = newState;
    notifyListeners();
  }

  Future<void> getProductsFromList() async {
    setApiState(ApiCallState.loadiang);
    isLoad = true;
    final String url = (ApiUrl.baseUrl + ApiUrl.loadProducts).trim();

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        isLoad = false;
        final data = json.decode(response.body);

        item =
            (data['products'] as List)
                .map((productJson) => Product.fromJson(productJson))
                .toList();
        setApiState(ApiCallState.success);
        notifyListeners();
      } else {
        setApiState(ApiCallState.error);
        isLoad = false;
        print('Failed to load products. Status code: ${response.statusCode}');
      }
    } catch (e) {
      setApiState(ApiCallState.error);
      isLoad = false;
      print('Error fetching products: $e');
    }
  }
  Future<void> getProductDetails(String id) async {
    String url = (ApiUrl.baseUrl + ApiUrl.loadProductWithid(id: id)).trim();
    final response = await http.get(Uri.parse(url));
    print(response.body);
  }
}
