import 'model.dart';

enum itemType {
  isName,
  isEmail,
  isBody,
}

class Comment extends Model<itemType> {
  late final int postId;
  late final int id;
  String? _name;
  String? _email;
  String? _body;

  Comment({
    required this.postId,
    required this.id,
    String? name,
    String? email,
    String? body,
  })  : _name = name,
        _email = email,
        _body = body;

  Comment.fromJson(Map<String, dynamic> json) {
    postId = json['postId'];
    id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _body = json['body'];
  }

  String get name => _name ?? "";
  String get email => _email ?? "";
  String get body => _body ?? "";

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['postId'] = postId;
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['body'] = body;
    return data;
  }

  @override
  bool isContain(String query, itemType type) {
    switch (type) {
      case itemType.isName:
        return name.contains(query);
      case itemType.isEmail:
        return email.contains(query);
      case itemType.isBody:
        return body.contains(query);
      default:
        return false;
    }
  }
}
