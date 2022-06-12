import 'model.dart';

enum itemType {
  isTitle,
  isBody,
}

class Post extends Model<itemType> {
  late final int id;
  int? _userId;
  String? _title;
  String? _body;

  Post({
    required this.id,
    int? userId,
    String? title,
    String? body,
  }) {
    if (title != null) _title = title;
    if (body != null) _body = body;
    if (userId != null) _userId = userId;
  }

  Post.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    _title = json["title"];
    _body = json['body'];
    _userId = json['userId'];
  }

  String get title => _title ?? "";
  String get body => _body ?? "";
  int get userId => _userId ?? 0;

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    data['userId'] = userId;
    return data;
  }

  @override
  bool isContain(String query, itemType type) {
    switch (type) {
      case itemType.isTitle:
        return title.contains(query);
      case itemType.isBody:
        return body.contains(query);
      default:
        return false;
    }
  }
}
