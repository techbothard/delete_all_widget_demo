import 'package:delete_all_widget_demo/app/api_network/app_exception.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class CheckResponse {
  static Future<void> checkReposeError(http.Response response,
      {bool showException = true}) async {
    switch (response.statusCode) {
      case 200:
        if (response.body.isEmpty) {
          final exception = AppException(
              message: "no body data found", code: response.statusCode);
          throw exception;
        }
        return;
      case 201:
        return;

      case 401:
        //todo:if you check Get.currentRoute is not splace screen then you redirect splace screen to restart app and clear the sharePrefrence value...
        var exception = AppException(
          message: "Unauthorized",
          code: response.statusCode,
        );
        throw exception;
      case 500:
        var exception = AppException(
          message: "Internal Server Error..!",
          code: response.statusCode,
        );
        throw exception;
      default:
        final data = response.body;
        var exception = AppException(
          message: data != null ? data : "Something went wrong..!",
          code: response.statusCode,
        );
        throw exception;
    }
  }
}
