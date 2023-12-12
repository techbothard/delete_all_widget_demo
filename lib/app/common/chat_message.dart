import 'package:flutter/material.dart';

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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
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
                  DateTime nextDate =
                      returnDateAndTime(messageList[index + 1].time);
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
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CurrencyCardView(
              icon:
                  'https://sanuslife-frontend.web.app/assets/images/sanuscoin.webp.png',
              price: '0.00',
              currencyName: 'SAC',
              quntity: '0.00',
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Container(
              // color: Colors.orange,
              // padding: EdgeInsets.only(top: 25),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                      left: 12,
                      top: -20,
                      child: Container(
                        height: 53,
                        width: 53,
                        decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            shape: BoxShape.circle,
                            gradient: LinearGradient(colors: [
                              Color(0XFFBECC00),
                              Color(0XFF71B22C),
                              Color(0XFF2CB7CA),
                              Color(0XFF2C83B3),
                              Color(0XFF1E2446),
                            ])),
                      )),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black87, width: 3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [Text("data")],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "Currency",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 18),
                            ),
                            Spacer(),
                            Text(
                              "\$ 12423435",
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        )
                      ],
                    ),
                  ),
                  Positioned(
                      left: 18.5,
                      top: -15,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.yellow, shape: BoxShape.circle),
                      ))
                ],
              ),
            ),
          ),
          ListTile(
            minLeadingWidth: 0,
            minVerticalPadding: 0,
            horizontalTitleGap: 0,
            leading: false
                ? Icon(
                    Icons.arrow_back,
                    color: Color(0XFF1E2446),
                  )
                : const SizedBox(
                    width: 25,
                  ),
            onTap: true ? () {} : null,
            title: Center(
              child: Transform.translate(
                offset: Offset(-12, 0),
                child: Text(
                  "title",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
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

class CurrencyCardView extends StatelessWidget {
  String? icon;
  String? currencyName;
  String? price;
  String? quntity;

  CurrencyCardView({this.currencyName, this.icon, this.price, this.quntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105,
      color: Colors.purple,
      alignment: Alignment.bottomCenter,
      child: Stack(
        children: [
          Transform.translate(
            offset: Offset(11, -24),
            child: Container(
              height: 53,
              width: 53,
              decoration: BoxDecoration(
                color: Colors.red,
                gradient: LinearGradient(colors: [
                  Color(0XFFBECC00),
                  Color(0XFF71B22C),
                  Color(0XFF2CB7CA),
                  Color(0XFF2C83B3),
                  Color(0XFF1E2446),
                ]),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Color(0xff00BADF),
                width: 3,
              ),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            height: 80,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Text(
                    //   'SAC',
                    //   // style: MyStyle.medium14.copyWith(color: Colors.grey),
                    // ),
                    // SizedBox(
                    //   width: 8,
                    // ),
                    Text(
                      '$quntity',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      '$currencyName',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'Rs $price',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Transform.translate(
            offset: Offset(15, -20),
            child: Image.network(
              icon ?? '',
              height: 45,
              width: 45,
            ),
          ),
        ],
      ),
    );
  }
}
