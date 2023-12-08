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

/*

void removeDotIfNoValueAfterIt() {
  final String value = controller.text;
  if (keyboardType == TextInputType.number && value.isNotEmpty && value[value.length - 1] == '.') {
    controller.text = value.substring(0, value.length - 1);
    controller.selection = TextSelection.fromPosition(
      TextPosition(offset: controller.text.length),
    );
  }
}
//secound

    pc.catName.value = TextEditingValue(
   text: text,
     selection: TextSelection.collapsed(offset: text.length),
      );

*/
