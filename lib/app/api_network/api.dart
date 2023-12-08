import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  Api._();
  static Api _api = Api._();
  factory Api() {
    return _api;
  }

  Future<dynamic> get(
      {required String endPoint, Map<String, dynamic>? parameter}) async {
    return await http.get(getUri(endPoint, parameter: parameter),
        headers: header());
  }

  Future<dynamic> post(
      {required String endPoint,
      Map<String, dynamic>? parameter,
      dynamic body}) async {
    return await http.post(getUri(endPoint, parameter: parameter),
        headers: header(), body: body != null ? jsonEncode(body) : null);
  }

  Future<dynamic> patch(
    String url, {
    Map<String, dynamic>? queryData,
    Map<String, dynamic>? bodyData,
  }) async {
    final response = await http.patch(
      getUri(url, parameter: queryData),
      body: jsonEncode(bodyData),
      headers: header(),
    );
    return response;
  }

  Future<dynamic> delete(
    String url, {
    Map<String, dynamic>? queryData,
    Map<String, dynamic>? bodyData,
  }) async {
    final response = await http.delete(
      getUri(url, parameter: queryData),
      body: jsonEncode(bodyData),
      headers: header(),
    );
    return response;
  }

  Future<dynamic> head(
    String url, {
    Map<String, dynamic>? queryData,
  }) async {
    final response = await http.head(
      getUri(url, parameter: queryData),
      headers: header(),
    );
    return response;
  }

  Future<dynamic> multiPartRequest(
    String url, {
    Map<String, dynamic>? queryData,
    String path = '',
  }) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('\${ApiConstants.BASE_URL}/common/uploadS3'));
    request.headers.addAll(header());
    request.files.add(await http.MultipartFile.fromPath('file', path));
    http.StreamedResponse response = await request.send();
    var result = await http.Response.fromStream(response);
    return result;
  }

  Future<dynamic> multipartRequestList(String url,
      {required String key,
      Map<String, String>? body,
      List<String>? imageList}) async {
    try {
      String fullURL = 'BASE_URL + url';
      var request = http.MultipartRequest('POST', Uri.parse(fullURL));
      request.headers.addAll(header());
      request.fields.addAll(body!);
      if (imageList != null && imageList.isNotEmpty) {
        imageList.forEach((element) async {
          request.files.add(await http.MultipartFile.fromPath(key, element));
        });
      }
      http.StreamedResponse response = await request.send();
      var result = await http.Response.fromStream(response);
      return result;
    } catch (exception) {
      // AppException.showException(exception);
    }
  }
}

Uri getUri(String enpPoint, {Map<String, dynamic>? parameter}) {
  String url = "baseurl" + enpPoint;
  if (parameter != null && parameter.isNotEmpty) {
    url += "?";
    for (int i = 0; i < parameter.entries.length; i++) {
      final entity = parameter.entries.elementAt(i);
      url += entity.key + "=" + entity.value;
      if (i < parameter.entries.length - 1) {
        url += "&";
      }
    }
  }
  return Uri.parse(url);
}

Map<String, String> header() {
  Map<String, String> header = <String, String>{};
  header['Content-Type'] = "application/json";
  header["Accept"] = "application/json";
  /*
 String token = SharedPrefs.getString(key: PrefString.token);
  log('Authorization Token : ${token}');
  if (token != '') {
    headers["Authorization"] = 'Bearer ${token}';
    // headers["X-token"] = '$token';
  }
  */
  return header;
}
