import 'model.dart';

enum itemType {
  isName,
  iscatchPhrase,
  isBs,
}

class Company extends Model<itemType> {
  String? _name;
  String? _catchPhrase;
  String? _bs;

  Company({String? name, String? catchPhrase, String? bs})
      : _name = name,
        _catchPhrase = catchPhrase,
        _bs = bs;

  Company.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _catchPhrase = json['catchPhrase'];
    _bs = json['bs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['catchPhrase'] = catchPhrase;
    data['bs'] = bs;
    return data;
  }

  String get name => _name ?? "";
  String get catchPhrase => _catchPhrase ?? "";
  String get bs => _bs ?? "";

  @override
  bool isContain(String query, itemType type) {
    switch (type) {
      case itemType.isName:
        return name.contains(query);
      case itemType.iscatchPhrase:
        return catchPhrase.contains(query);
      case itemType.isBs:
        return bs.contains(query);
      default:
        return false;
    }
  }
}
