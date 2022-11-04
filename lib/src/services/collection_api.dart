import 'dart:convert';

import 'package:get/get_connect.dart';
import 'package:mart/src/models/department.dart';

class CollectionApiService extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl =
        'https://collectionapi.metmuseum.org/public/collection/v1/';
  }

  Future<List<Department>?> getDepartments() async {
    final response = await get<Map<String, dynamic>>('departments');
    if (response.isOk) {
      var json = response.body;
      final items = <Department>[];
      for (final rawItem in json?['departments']) {
        items.add(Department.fromJson(rawItem));
      }
      return items;
    }

    return null;
  }
}
