import 'package:get/get_connect.dart';
import 'package:mart/src/models/department.dart';

class CollectionApiService extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl =
        'https://collectionapi.metmuseum.org/public/collection/v1/';
  }

  Future<List<Department>?> getDepartments() async {
    final response = await get<List<Department>>('departments');
    if (response.isOk) {
      return response.body;
    }

    return null;
  }
}
