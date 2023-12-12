import 'package:flutter/material.dart';

class CheckBox_Radio_Screen extends StatefulWidget {
  const CheckBox_Radio_Screen({super.key});

  @override
  State<CheckBox_Radio_Screen> createState() => _CheckBox_Radio_ScreenState();
}

class _CheckBox_Radio_ScreenState extends State<CheckBox_Radio_Screen> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Radio_check"),
      ),
      body: Column(
        children: [
          CheckBoxScreen(
            ckeckValue: value,
            onChange: (p0) {
              setState(() {
                this.value = p0 ?? false;
              });
            },
          ),
          radioScreen(
            groupValue: radioValue,
            onChange: (p0) {
              setState(() {
                radioValue = p0 ?? 0;
              });
            },
          )
        ],
      ),
    );
  }

  int radioValue = 0;
}

class CheckBoxScreen extends StatelessWidget {
  CheckBoxScreen({super.key, required this.onChange, required this.ckeckValue});
  bool ckeckValue;
  void Function(bool?)? onChange;
  @override
  Widget build(BuildContext context) {
    return Checkbox(value: ckeckValue, onChanged: onChange);
  }
}

class radioScreen extends StatelessWidget {
  radioScreen({super.key, required this.onChange, required this.groupValue});

  void Function(int?)? onChange;
  int groupValue;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) {
        return RadioMenuButton(
            value: index,
            groupValue: groupValue,
            onChanged: (v) {
              onChange?.call(index);
            },
            child: Text("$index data"));
      },
    );
  }
}
