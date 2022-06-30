class PostModel {
  int? id;
  String? title;
  String? body;


  PostModel({this.id, this.title, this.body});

   PostModel.fromJson(Map<String, dynamic> jsonData) {
     id=  jsonData['id'];
      title=  jsonData['title'];
      body= jsonData['body'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['body'] = body;

    return data;
  }
}