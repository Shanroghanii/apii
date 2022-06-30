import 'dart:convert';
import 'package:apii/model/post_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class PostApi extends GetxService {
  // Post API
  String baseUrl= "https://jsonplaceholder.typicode.com/Posts";
  Future<List<PostModel>> getPostData() async {
    try {
      var jsonData;
      var data = await http.get(
        Uri.parse(baseUrl),
      );
      print(data.statusCode);
      jsonData = json.decode(data.body);
      if (data.statusCode == 200) {

        List<PostModel> list = List<PostModel>.from(jsonData.map((x) => PostModel.fromJson(x)));
        print(list.first.body);
        return list;
      } else {
        print("print Error msg");
      }
    } on Exception catch (_) {
      print("print Error msg");
    }
    return [];
  }
}