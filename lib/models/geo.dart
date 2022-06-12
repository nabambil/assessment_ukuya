import 'package:assessment/models/model.dart';

enum itemType { isLat, isLng }

class Geo extends Model<itemType> {
  late final String _lat;
  late final String _lng;

  Geo({required String lat, required String lng})
      : _lat = lat,
        _lng = lng;

  Geo.fromJson(Map<String, dynamic> json) {
    _lat = json['lat'];
    _lng = json['lng'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = _lat;
    data['lng'] = _lng;
    return data;
  }

  @override
  bool isContain(String query, itemType type) {
    switch (type) {
      case itemType.isLat:
        return _lat.contains(query);
      case itemType.isLng:
        return _lng.contains(query);
      default:
        return false;
    }
  }
}
