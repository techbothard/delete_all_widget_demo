import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatMessageScreen extends StatefulWidget {
  const ChatMessageScreen({super.key});

  @override
  State<ChatMessageScreen> createState() => _ChatMessageScreenState();
}

class _ChatMessageScreenState extends State<ChatMessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat mesage'),
      ),
      body: ListView.builder(
        itemCount: messageList.length,
        reverse: true,
        itemBuilder: (context, index) {
          final data = messageList[index];
          bool isSameDate = false;
          String newDate = "";
          if (index == 0 && messageList.length == 1) {
            newDate = groupDate(data.time);
          } else if (index == messageList.length - 1) {
            newDate = groupDate(data.time);
          } else {
            DateTime date = returnDateAndTime(data.time);
            DateTime nextDate = returnDateAndTime(messageList[index + 1].time);
            isSameDate = date.isAtSameMomentAs(nextDate);
            newDate = isSameDate ? "" : groupDate(data.time);
          }

          return Column(
            children: [
              if (newDate != "")
                Align(
                  alignment: Alignment.center,
                  child: Text(newDate),
                ),
              Row(
                children: [
                  if (index % 2 == 0) Spacer(),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black87)),
                    child: Text(
                      "$index",
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  DateTime returnDateAndTime(int time) {
    var dat = DateTime.fromMicrosecondsSinceEpoch(time);
    return DateTime(dat.year, dat.month, dat.day);
  }

  String groupDate(int time) {
    var dt = DateTime.fromMicrosecondsSinceEpoch(time);
    DateTime adate = DateTime(dt.year, dt.month, dt.day);
    final todays = DateTime.now();
    final today = DateTime(todays.year, todays.month, todays.day);
    final yesterday = DateTime(todays.year, todays.month, todays.day - 1);
    if (today == adate) {
      return "Today";
    } else if (yesterday == adate) {
      return "Yesterday";
    } else {
      // return DateFormat.yMd().format(adate);
      final month = giveMonth(adate.month);
      return "${adate.day} $month ${adate.year}";
    }
  }
}

String giveMonth(int day) {
  switch (day) {
    case 1:
      return "January";
    case 2:
      return "February";
    case 3:
      return "March";
    case 4:
      return "April";
    case 5:
      return "May";
    case 6:
      return "June";
    case 7:
      return "July";
    case 8:
      return "August";
    case 9:
      return "September";
    case 10:
      return "Octomber";
    case 11:
      return "November";
    default:
      return "December";
  }
}

List<Message> messageList = [
  Message(
      id: 1, message: "message", time: DateTime.now().microsecondsSinceEpoch),
  Message(
      id: 2, message: "message", time: DateTime.now().microsecondsSinceEpoch),
  Message(
      id: 3, message: "message", time: DateTime.now().microsecondsSinceEpoch),
  Message(
      id: 4, message: "message", time: DateTime.now().microsecondsSinceEpoch),
  Message(
      id: 5,
      message: "message",
      time: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day - 1, 14, 30)
          .microsecondsSinceEpoch),
  Message(
      id: 6,
      message: "message",
      time: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day - 1, 14, 30)
          .microsecondsSinceEpoch),
  Message(
      id: 7,
      message: "message",
      time: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day - 1, 14, 30)
          .microsecondsSinceEpoch),
  Message(
      id: 8,
      message: "message",
      time: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day - 1, 14, 30)
          .microsecondsSinceEpoch),
  Message(
      id: 9,
      message: "message",
      time: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day - 2, 14, 30)
          .microsecondsSinceEpoch),
  Message(
      id: 0,
      message: "message",
      time: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day - 2, 14, 30)
          .microsecondsSinceEpoch),
  Message(
      id: 11,
      message: "message",
      time: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day - 2, 14, 30)
          .microsecondsSinceEpoch),
  Message(
      id: 11,
      message: "message",
      time: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day - 2, 14, 30)
          .microsecondsSinceEpoch),
  Message(
      id: 11,
      message: "message",
      time: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day - 3, 14, 30)
          .microsecondsSinceEpoch),
  Message(
      id: 11,
      message: "message",
      time: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day - 3, 14, 30)
          .microsecondsSinceEpoch),
  Message(
      id: 11,
      message: "message",
      time: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day - 3, 14, 30)
          .microsecondsSinceEpoch),
  Message(
      id: 11,
      message: "message",
      time: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day - 3, 14, 30)
          .microsecondsSinceEpoch),
  Message(
      id: 11,
      message: "message",
      time: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day - 4, 14, 30)
          .microsecondsSinceEpoch),
  Message(
      id: 11,
      message: "message",
      time: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day - 4, 14, 30)
          .microsecondsSinceEpoch),
  Message(
      id: 11,
      message: "message",
      time: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day - 4, 14, 30)
          .microsecondsSinceEpoch),
  Message(
      id: 11,
      message: "message",
      time: DateTime(DateTime.now().year, DateTime.now().month - 1,
              DateTime.now().day - 5, 14, 30)
          .microsecondsSinceEpoch),
  Message(
      id: 11,
      message: "message",
      time: DateTime(DateTime.now().year, DateTime.now().month - 1,
              DateTime.now().day - 6, 14, 30)
          .microsecondsSinceEpoch),
  Message(
      id: 11,
      message: "message",
      time: DateTime(DateTime.now().year, DateTime.now().month - 1,
              DateTime.now().day - 6, 14, 30)
          .microsecondsSinceEpoch),
  Message(
      id: 11,
      message: "message",
      time: DateTime(DateTime.now().year, DateTime.now().month - 2,
              DateTime.now().day - 4, 14, 30)
          .microsecondsSinceEpoch),
  Message(
      id: 11,
      message: "message",
      time: DateTime(DateTime.now().year, DateTime.now().month - 2,
              DateTime.now().day - 4, 14, 30)
          .microsecondsSinceEpoch),
  Message(
      id: 11,
      message: "message",
      time: DateTime(DateTime.now().year, DateTime.now().month - 2,
              DateTime.now().day - 15, 14, 30)
          .microsecondsSinceEpoch),
  Message(
      id: 11,
      message: "message",
      time: DateTime(DateTime.now().year, DateTime.now().month - 3,
              DateTime.now().day - 4, 14, 30)
          .microsecondsSinceEpoch),
];

class Message {
  int id;
  String message;
  int time;

  Message({required this.id, required this.message, required this.time});
}
