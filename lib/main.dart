import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:mart/src/router.dart';
import 'package:mart/src/services/collection_api.dart';
import 'package:mart/src/services/repository.dart';

import 'src/models/department.dart';

void main() async {
  await initServices();
  runApp(const MyApp());
}

Future initServices() async {
  final isar = await Isar.open([DepartmentSchema]);
  Get.put(isar);
  Get.put(CollectionApiService());
  Get.put(Repository());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'MArt',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      routerConfig: router,
    );
  }
}
