import 'dart:developer';
import 'dart:io';

class AppException implements Exception {
  String message;
  int code;
  String? tag;

  AppException({required this.message, required this.code, this.tag});

  @override
  String toString() {
    return "${code.toString()} : ${tag ?? "No tag"} : ${message}";
  }

  static void showException(dynamic exception, [dynamic stackTrace]) {
    if (exception is AppException) {
      exception.show();
    } else if (exception is SocketException) {
      AppException(
              message: exception.message,
              code: exception.osError?.errorCode ?? 0)
          .show();
    } else if (exception is HttpException) {
      AppException(message: "Couldn't find the requested data", code: 0).show();
    } else if (exception is FormatException) {
      AppException(message: "Bad response format", code: 0).show();
    } else {
      AppException(message: "Something went wrong", code: 0).show();
    }
  }

  void show() {
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('message: $message, title: Error')));
    log('message: $message, title: Error');
  }
}
