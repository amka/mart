import 'package:flutter/material.dart';
import 'package:get/get_connect.dart';
import 'package:mart/src/models/department.dart';

import '../models/art_object.dart';

class CollectionApiService extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl =
        'https://collectionapi.metmuseum.org/public/collection/v1/';
  }

  Future<List<Department>?> getDepartments() async {
    debugPrint('Getting Departments');
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

  Future<List<int>?> getDepartmentObjects(int departmentId) async {
    final response = await get<Map<String, dynamic>>(
      'objects',
      query: {'departmentIds': departmentId.toString()},
    );

    if (response.isOk && response.body!.containsKey('objectIDs')) {
      return List<int>.from(response.body?['objectIDs']);
    }

    return null;
  }

  Future<ArtObject?> getDepartmentObject(int objectId) async {
    final response = await get<Map<String, dynamic>>('object/$objectId');

    if (response.isOk && response.body != null) {
      return ArtObject.fromJson(response.body!);
    }

    return null;
  }
}
