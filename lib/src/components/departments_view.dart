import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mart/src/services/repository.dart';

import 'department_card.dart';
import '../models/department.dart';

class DepartmetnsView extends StatefulWidget {
  const DepartmetnsView({super.key});

  @override
  State<DepartmetnsView> createState() => _DepartmetnsViewState();
}

class _DepartmetnsViewState extends State<DepartmetnsView> {
  Repository repository = Get.find();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: repository.getDepartments(),
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
