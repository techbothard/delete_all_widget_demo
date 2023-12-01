import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class ShaderMaskScreen extends StatefulWidget {
  const ShaderMaskScreen({super.key});

  @override
  State<ShaderMaskScreen> createState() => _ShaderMaskScreenState();
}

class _ShaderMaskScreenState extends State<ShaderMaskScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    animation = Tween<Offset>(begin: Offset(0, .5), end: Offset(0, 1)).animate(
        CurvedAnimation(parent: animationController, curve: Curves.ease));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shader Mask"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 400,
              width: double.infinity,
              color: Colors.amberAccent,
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 170),
              child: FadeInDown(
                child: SlideTransition(
                  position: animation,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        color: Colors.black87,
                        width: 200,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 50,
                        color: Colors.blueGrey,
                        width: 200,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Container(
              height: 50,
              color: Colors.black87,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 2),
                        blurRadius: 2,
                        spreadRadius: 2)
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      top: 8,
                    ),
                    child: Text(
                      "IND 50",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Divider(
                    color: Colors.black87,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                            text: TextSpan(
                                text: "05 DEC ",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                                children: [
                              TextSpan(
                                  text: "MON",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 14))
                            ])),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.watch_later_outlined,
                              size: 14,
                            ),
                            Text(" 159H : 48M :34S",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700))
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(3),
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.blueAccent.withOpacity(.2)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.currency_pound,
                          color: Colors.yellow,
                          size: 16,
                        ),
                        Text(
                          " 2 Joined",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          color: Colors.black87,
                          width: 1,
                          height: 15,
                        ),
                        Icon(
                          Icons.monetization_on,
                          color: Colors.purpleAccent,
                          size: 16,
                        ),
                        Text(
                          " 2 Squads",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                        Spacer(),
                        Icon(
                          Icons.notification_add,
                          color: Colors.black87,
                          size: 16,
                        ),
                        Text(
                          '  Get Notified ',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.withOpacity(.8),
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
