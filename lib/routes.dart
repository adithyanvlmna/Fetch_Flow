import 'package:fetch_flow/view/home_view.dart';
import 'package:fetch_flow/view/product_view.dart';
import 'package:fetch_flow/view/splash_screen.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext context)> routes = {
HomeView.routeName:(context)=>HomeView(),
ProductView.routeName:(context)=>ProductView(),

SplashScreen.routeName:(context)=>SplashScreen(),
};
