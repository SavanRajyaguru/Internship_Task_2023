class PostInfo {
  int? userId;
  int? id;
  String? title;
  String? body;

  PostInfo({this.userId, this.id, this.title, this.body});

  PostInfo.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['userId'] = userId ?? 0;
    data['id'] = id ?? 1;
    data['title'] = title ?? 'null title';
    data['body'] = body ?? 'null Body';
    return data;
  }
}

