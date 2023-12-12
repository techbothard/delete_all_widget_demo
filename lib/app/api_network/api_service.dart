import 'dart:convert';
import 'dart:developer';

import 'api.dart';
import 'check_response.dart';

class ApiService {
  /// sent the model
  static Future<dynamic> getData() async {
    try {
      final res = await Api().get(endPoint: "endPoint");
      await CheckResponse.checkReposeError(res);
      // return model ma convert kari ne return;
    } catch (e, st) {
      log("handleAccount catchBloc error: $e && st: $st");
      rethrow;
    }
  }
}
