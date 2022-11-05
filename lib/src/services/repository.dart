import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:mart/src/models/department.dart';
import 'package:mart/src/services/collection_api.dart';

class Repository extends GetxController {
  CollectionApiService apiService = Get.find();
  Isar isar = Get.find();

  Future<List<Department>?> getDepartments() async {
    var departments = await isar.departments.where().findAll();
    // Check for cached version
    if (departments.isEmpty) {
      // If the cache is empty, then request data from the server
      final items = await apiService.getDepartments();
      if (items == null) {
        return null;
      }

      await isar.writeTxn(() async => await isar.departments.putAll(items));
      departments = items;
    }

    return departments;
  }

  Future<List<int>?> getDepartmentObjects(int departmentId) async {
    // Check for cached version
    // if (box.hasData(key)) {
    //   return box.read(key);
    // }

    // If the cache is empty, then request data from the server
    final items = await apiService.getDepartmentObjects(departmentId);
    // if (items != null) {
    //   box.write(key, items);
    // }
    return items;
  }
}
