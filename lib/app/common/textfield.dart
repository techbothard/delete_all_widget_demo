import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class TextInputField extends StatelessWidget {
  TextInputField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.obsecure = false,
      this.suffix = false,
      required this.validate,
      this.textInputType = TextInputType.emailAddress});
  TextEditingController controller;
  String hintText;
  bool obsecure;
  bool suffix;
  String? Function(String?)? validate;
  TextInputType textInputType;
  ValueNotifier<bool> valunoti = ValueNotifier(true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ValueListenableBuilder(
              valueListenable: valunoti,
              builder: (context, value, child) {
                if (!obsecure) {
                  value = false;
                }
                return TextFormField(
                  controller: controller,
                  keyboardType: textInputType,
                  validator: validate,
                  obscureText: value,
                  onTapOutside: (v) {
                    FocusScope.of(context).unfocus();
                  },
                  onChanged: (value) {
                    removeDotIfNoValueAfterIt();
                  },
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.only(left: 20, top: 22, bottom: 22),
                      hintText: hintText,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.green)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.black87)),
                      suffixIcon: suffix
                          ? IconButton(
                              onPressed: () {
                                valunoti.value = !value;
                              },
                              icon: Icon(suffix
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined))
                          : null),
                );
              },
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 3),
                        blurRadius: 4,
                        spreadRadius: 2),
                  ]),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "assets/images/img_image_4.png",
                      height: 100,
                      width: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.only(left: 10, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Title",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text("Product are amaging"),
                        SizedBox(
                          height: 4,
                        ),
                        Text("Price \$120.2"),
                        SizedBox(
                          height: 4,
                        ),
                      ],
                    ),
                  ))
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  width: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            spreadRadius: 4)
                      ]),
                  child: Material(
                    borderRadius: BorderRadius.circular(12),
                    clipBehavior: Clip.hardEdge,
                    child: Image.asset(
                      "assets/images/img_image_7.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Title",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text("Product are amaging"),
                      SizedBox(
                        height: 4,
                      ),
                      Text("Price \$120.2"),
                      SizedBox(
                        height: 4,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void removeDotIfNoValueAfterIt() {
    final String value = controller.text;
    if (value.isNotEmpty && value[value.length - 1] == '.') {
      controller.text = value.substring(0, value.length - 1);
      controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length),
      );
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
