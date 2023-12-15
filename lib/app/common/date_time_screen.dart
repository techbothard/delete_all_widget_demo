import 'package:flutter/material.dart';

class DateTimeScreen extends StatefulWidget {
  const DateTimeScreen({super.key});

  @override
  State<DateTimeScreen> createState() => _DateTimeScreenState();
}

class _DateTimeScreenState extends State<DateTimeScreen> {
  String date = "";
  String time = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Date Time Picker"),
      ),
      body: Column(
        children: [
          RawMaterialButton(
            onPressed: () async {
              var dateTime = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1999),
                  lastDate: DateTime(2030));
              if (dateTime != null) {
                date = dateTime.toString();
                setState(() {});
              }
            },
            child: Text("Date Picker"),
          ),
          if (date != "") Text(date),
          ElevatedButton(
              onPressed: () async {
                var times = await showTimePicker(
                    context: context, initialTime: TimeOfDay.now());
                if (times != null) {
                  time = times.toString();
                  setState(() {});
                }
              },
              child: Text("Time Pick")),
          if (time != "") Text(time),
          CircularProgressIndicator(
            color: Colors.amberAccent,
            backgroundColor: Colors.black87,
            // value: .5,
            valueColor: AlwaysStoppedAnimation(Colors.deepPurpleAccent),
            strokeWidth: 10,
            semanticsLabel: "CircularProgressIndicator",
          ),
          SizedBox(
            height: 10,
          ),
          LinearProgressIndicator(
            value: .6,
            minHeight: 5,
            color: Colors.deepPurpleAccent,
            // valueColor: AlwaysStoppedAnimation(Colors.cyanAccent),
          ),
        ],
      ),
    );
  }
}
