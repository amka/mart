import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/collection_api.dart';

class GalleryView extends StatelessWidget {
  GalleryView({super.key, required this.deparmentId});

  final int deparmentId;
  CollectionApiService collectionApi = Get.find();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: collectionApi.getDepartmentObjects(deparmentId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.amber[200],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        Text(snapshot.data![index].toString()),
                      ],
                    ),
                  );
                });
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: 8),
                Text('Fetching department $deparmentId…')
              ],
            );
          }
        });
  }
}
