import 'geo.dart';
import 'model.dart';

enum itemType {
  isStreet,
  isSuite,
  isCity,
  isZipcode,
}

class Address extends Model<itemType> {
  String? _street;
  String? _suite;
  String? _city;
  String? _zipcode;
  Geo? geo;

  Address({
    String? street,
    String? suite,
    String? city,
    String? zipcode,
    this.geo,
  })  : _street = street,
        _suite = suite,
        _city = city,
        _zipcode = zipcode;

  Address.fromJson(Map<String, dynamic> json) {
    _street = json['street'];
    _suite = json['suite'];
    _city = json['city'];
    _zipcode = json['zipcode'];
    geo = json['geo'] != null ? Geo.fromJson(json['geo']) : null;
  }

  String get street => _street ?? "";
  String get suite => _suite ?? "";
  String get city => _city ?? "";
  String get zipcode => _zipcode ?? "";

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['street'] = street;
    data['suite'] = suite;
    data['city'] = city;
    data['zipcode'] = zipcode;
    if (geo != null) {
      data['geo'] = geo!.toJson();
    }
    return data;
  }

  @override
  bool isContain(String query, itemType type) {
    switch (type) {
      case itemType.isStreet:
        return street.contains(query);
      case itemType.isSuite:
        return suite.contains(query);
      case itemType.isCity:
        return city.contains(query);
      case itemType.isZipcode:
        return zipcode.contains(query);
      default:
        return false;
    }
  }
}
