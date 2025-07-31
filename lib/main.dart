import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:fetch_flow/providers/items_list_provider.dart';
import 'package:fetch_flow/routes.dart';

import 'package:fetch_flow/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (ctx)=>ItemsListProvider())
    ],
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ConnectivityAppWrapper(
      app: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fetch_Flow',
        initialRoute: SplashScreen.routeName,
        routes: routes,
      ),
    );
  }
}
