import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:tcard/tcard.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<String> images = [
    'assets/images/img_image_1.png',
    'assets/images/img_image_2.png',
    'assets/images/img_image_3.png',
    'assets/images/img_image_4.png',
    'assets/images/img_image_5.png',
    'assets/images/img_image_6.png',
    'assets/images/img_image_7.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("notification"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 200,
              child: CardSwiper(
                cardsCount: 10,
                direction: CardSwiperDirection.left,
                backCardOffset: Offset(20, -20),
                maxAngle: 20,
                allowedSwipeDirection:
                    AllowedSwipeDirection.symmetric(horizontal: true),
                cardBuilder: (context, index, horizontalOffsetPercentage,
                    verticalOffsetPercentage) {
                  return Container(
                    color: index % 3 == 0
                        ? Colors.orangeAccent
                        : index % 3 == 1
                            ? Colors.purpleAccent
                            : Colors.pinkAccent,
                    height: 180,
                    alignment: Alignment.center,
                    child: Text("$index"),
                  );
                },
              ),
            ),
            TCard(
                cards: List.generate(
                    images.length,
                    (index) => Card(
                          child: Image.asset(
                            images[index],
                            height: 130,
                            width: 130,
                            fit: BoxFit.cover,
                          ),
                        ))),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          exit(0);
          // SystemNavigator.pop();
        },
        child: Icon(Icons.exit_to_app),
      ),
    );
  }
}

//todo: above application tag
// <meta-data
// android:name="com.google.firebase.messaging.default_notification_channel_id"
// android:value="default_notification_channel_id" />
//todo: under actvity tag
// <meta-data
// android:name="com.google.firebase.messaging.default_notification_channel_id"
// android:value="123" />
// <intent-filter>
// <action android:name="FLUTTER_NOTIFICATION_CLICK" />
// <category android:name="android.intent.category.DEFAULT" />
// </intent-filter>
//
// <intent-filter>
// <action android:name="com.google.firebase.MESSAGING_EVENT" />
// </intent-filter>

class NotificationService {
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  Future<void> firebaseMessageRequest() async {
    log("hey");
    await firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );

    await firebaseMessaging.requestPermission(
        provisional: true, badge: true, criticalAlert: true);

    await FirebaseMessaging.instance.getToken().then((value) {
      log("token=12=$value");
    });
  }

  Future<void> firebaseBackground(BuildContext context) async {
    print("backbcakbncak");
    final message = await firebaseMessaging.getInitialMessage();
    if (message != null) {
      //handle click to redirect
      log("initial message+++++++++++++++++++++");
    }
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      //handle click to re direct
      log("onMessageOpenedApp--------------------------------------");
    });
  }

  Future<void> firebaseForground(BuildContext context) async {
    print("forforforfor");
    FirebaseMessaging.onMessage.listen((event) {
      log("onMessage-@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");

      initializeLocalNotification(message: event, context: context);
      showLocalNotification(message: event);
    });
  }

  ///flutter local notification

  FlutterLocalNotificationsPlugin localNotification =
      FlutterLocalNotificationsPlugin();
  Future<void> initializeLocalNotification(
      {required RemoteMessage message, required BuildContext context}) async {
    final android = AndroidInitializationSettings("@mipmap/ic_launcher");
    final ios = DarwinInitializationSettings(
      defaultPresentAlert: true,
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestProvisionalPermission: true,
      requestCriticalPermission: true,
    );
    final initialize = InitializationSettings(android: android, iOS: ios);
    localNotification.initialize(
      initialize,
      onDidReceiveNotificationResponse: (details) {
        //handle to show click to redirect
      },
    );
  }

  Future<void> showLocalNotification({required RemoteMessage message}) async {
    final android = AndroidNotificationDetails(
      "123",
      "channelName",
      channelDescription: "High importance",
      priority: Priority.high,
      importance: Importance.max,
    );
    final ios = DarwinNotificationDetails(
        presentAlert: true, presentBadge: true, presentSound: true);
    final notificationDetails = NotificationDetails(android: android, iOS: ios);
    final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    localNotification.show(id, message.notification?.title,
        message.notification?.body, notificationDetails);
  }
}
