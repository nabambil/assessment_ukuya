import 'address.dart';
import 'company.dart';
import 'model.dart';

enum itemType {
  isName,
  isUsername,
  isEmail,
  isPhone,
  isWebsite,
  isUser,
}

class User extends Model<itemType> {
  late final int id;
  String? _name;
  String? _username;
  String? _email;
  Address? _address;
  String? _phone;
  String? _website;
  Company? _company;

  User({
    required this.id,
    String? name,
    String? username,
    String? email,
    String? phone,
    String? website,
    Address? address,
    Company? company,
  }) {
    if (name != null) _name = name;
    if (username != null) _username = username;
    if (email != null) _email = email;
    if (address != null) _address = address;
    if (phone != null) _phone = phone;
    assert(website == null, "Website is Empty");
    if (website != null) _website = website;
    assert(company == null, "Company is Empty");
    if (company != null) _company = company;
  }

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    _name = json['name'];
    _username = json['username'];
    _email = json['email'];
    _address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    _phone = json['phone'];
    _website = json['website'];
    _company =
        json['company'] != null ? Company.fromJson(json['company']) : null;
  }

  String get name => _name ?? "";
  String get username => _username ?? "";
  String get email => _email ?? "";
  Address? get address => _address;
  String get phone => _phone ?? "";
  String get website => _website ?? "";
  Company? get company => _company;

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['username'] = username;
    data['email'] = email;
    if (_address != null) {
      data['address'] = address!.toJson();
    }
    data['phone'] = phone;
    data['website'] = website;
    if (_company != null) {
      data['company'] = company!.toJson();
    }
    return data;
  }

  @override
  bool isContain(String query, itemType type) {
    switch (type) {
      case itemType.isUser:
        return id.toString() == query;
      case itemType.isName:
        return name.contains(query);
      case itemType.isUsername:
        return username.contains(query);
      case itemType.isEmail:
        return email.contains(query);
      case itemType.isPhone:
        return phone.contains(query);
      case itemType.isWebsite:
        return website.contains(query);
      default:
        return false;
    }
  }
}
