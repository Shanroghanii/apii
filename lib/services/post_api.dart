import 'dart:convert';
import 'package:apii/model/post_model.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PostApi extends GetxService {
  // Post API
  String baseUrl = "https://jsonplaceholder.typicode.com/Posts";
  Future<List<PostModel>> getPostData() async {
    try {
      var jsonData = [];
      var data = await http.get(
        Uri.parse(baseUrl),
      );
      if (kDebugMode) {
        print(data.statusCode);
      }
      jsonData = json.decode(data.body);
      if (data.statusCode == 200) {
        List<PostModel> list =
            List<PostModel>.from(jsonData.map((x) => PostModel.fromJson(x)));
        if (kDebugMode) {
          print(list.first.body);
        }
        return list;
      } else {
        if (kDebugMode) {
          print("show Error msg");
        }
      }
    } on Exception catch (_) {
      if (kDebugMode) {
        print("show Error msg");
      }
    }
    return [];
  }
}
