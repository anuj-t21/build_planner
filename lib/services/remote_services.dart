import 'dart:convert';

import 'package:get/get.dart';

class RemoteService extends GetConnect {
  Future<Response> getAPI(String url) => get(url);

  Future<dynamic> fetchData(String url) async {
    var response = await getAPI(url);
    if (response.statusCode == 200) {
      var responseData = json.decode(response.body) as Map<String, dynamic>;
      return responseData['data'];
    } else {
      return null;
    }
  }
}
