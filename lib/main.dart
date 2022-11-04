import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mart/src/router.dart';
import 'package:mart/src/services/collection_api.dart';

void main() async {
  Get.put(CollectionApiService());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'MArt',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      routerConfig: router,
    );
  }
}
