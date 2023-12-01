import 'package:flutter/material.dart';

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
            ],
          ),
        ));
  }
}
