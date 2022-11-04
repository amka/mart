import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mart/src/services/collection_api.dart';

import '../models/department.dart';

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
            padding: EdgeInsets.all(16),
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

class DepartmentCard extends StatelessWidget {
  final Department department;

  const DepartmentCard(this.department, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black12,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                department.displayName,
                textAlign: TextAlign.center,
                style: GoogleFonts.ibmPlexSans(
                    fontSize: 18, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
