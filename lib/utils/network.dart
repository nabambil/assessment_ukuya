import 'dart:convert';

import 'package:assessment/utils/constant.dart';
import 'package:http/http.dart' as http;

abstract class Network<T> {
  Future<T> get();
  Future<T> post();
}

class NetworkImp<T> implements Network {
  late final Uri _endpoint;
  final Map<String, String> _header = <String, String>{};
  final Map<String, String> _param = <String, String>{};

  set endpoint(String value) => _endpoint = Uri.parse(kDevDomain + value);

  setHeader(String key, String value) => _header.addAll({key: value});
  setParam(String key, String value) => _param.addAll({key: value});

  @override
  Future<T> get() async {
    final response = await http.get(_endpoint);

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);

      if (T == Map<String, dynamic>) {
        return result as T;
      }

      if (T == List<Map<String, dynamic>>) {
        final List<Map<String, dynamic>> remap =
            result.map<Map<String, dynamic>>((e) => Map.from(e)).toList();

        return remap as T;
      }

      throw Exception("Unhandle Type");
    } else {
      throw Exception('Failed to load');
    }
  }

  @override
  Future<T> post() async {
    final response = await http.post(_endpoint, headers: _header, body: _param);

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);

      if (T is Map<String, dynamic>) {
        return result as T;
      }

      if (T is List<Map<String, dynamic>>) {
        final List<Map<String, dynamic>> remap =
            result.map<Map<String, dynamic>>((e) => jsonDecode(e)).toList();

        return remap as T;
      }

      throw "Unhandle Type";
    } else {
      throw Exception('Failed to load');
    }
  }
}
