import 'package:apii/model/post_model.dart';
import 'package:get/get.dart';

import '../../services/post_api.dart';

class HomeController extends GetxController{
  List<PostModel> post = [];

  @override
  Future<void> onInit() async {
    post=  await PostApi().getPostData();
    update();
    super.onInit();
  }
}