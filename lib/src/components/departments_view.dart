import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'department_card.dart';
import '../models/department.dart';
import '../services/collection_api.dart';

class DepartmetnsView extends StatefulWidget {
  const DepartmetnsView({super.key});

  @override
  State<DepartmetnsView> createState() => _DepartmetnsViewState();
}

class _DepartmetnsViewState extends State<DepartmetnsView> {
  CollectionApiService collectionApi = Get.find();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: collectionApi.getDepartments(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          List<Department> items = snapshot.data;
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1 / 1.25,
            ),
            itemCount: items.length,
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, index) => DepartmentCard(items[index]),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
