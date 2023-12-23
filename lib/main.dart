import 'dart:async';
import 'dart:ui';
import 'package:delete_all_widget_demo/app/database/hive/model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'app/all_show_widget/common_widget.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:delete_all_widget_demo/app/common/notification.dart';

Future backgroundmessage(RemoteMessage message) async {
  print("backgroundbackgroundbackground");
  await Firebase.initializeApp();
  print('backgroundmessaging== ${await message.notification}');
  print('backgroundmessaging== ${message}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await setupservicelocatore();
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(backgroundmessage);
  NotificationService().firebaseMessageRequest();

  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(NoteModelAdapter());
  // await initService();
  await Hive.openBox<NoteModel>("note");

  runApp(MyApp());
}

Future<void> initService() async {
  final service = FlutterBackgroundService();

  await service.configure(
    iosConfiguration: IosConfiguration(),
    androidConfiguration: AndroidConfiguration(
        onStart: onStart, isForegroundMode: true, autoStart: true),
  );

  await service.startService();
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CommonWidget(),
    );
  }
}

onStart(ServiceInstance service) async {
  DartPluginRegistrant.ensureInitialized();
  if (service is AndroidServiceInstance) {
    service.on("setAsForeground").listen((event) {
      service.setAsForegroundService();
    });
    service.on("setAsBackground").listen((event) {
      service.setAsBackgroundService();
    });
  }
  service.on("stopService").listen((event) {
    service.stopSelf();
  });

  Timer.periodic(
    Duration(seconds: 2),
    (timer) async {
      if (service is AndroidServiceInstance) {
        if (await service.isForegroundService()) {
          service.setForegroundNotificationInfo(
              title: "title", content: "content ${DateTime.now()}");
        }
      }
    },
  );
}
/*

import io.flutter.app.FlutterApplication
import io.flutter.plugin.common.PluginRegistry
import io.flutter.plugins.firebase.messaging.FlutterFirebaseMessagingBackgroundService
import io.flutter.plugins.firebase.messaging.FlutterFirebaseMessagingPlugin
class Application: FlutterApplication(), PluginRegistry.PluginRegistrantCallback {
override fun onCreate() {
  super.onCreate()FlutterFirebaseMessagingBackgroundService.setPluginRegistrant(this)
}
override fun registerWith(registry:PluginRegistry) {
FlutterFirebaseMessagingPlugin.registerWith(registry?.registrarFor(“io.flutter.plugins.firebasemessaging.FirebaseMessagingPlugin”))
}
}

*/
//todo:
/*

import UIKit
import Flutter
import FirebaseCore
import Firebase

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate, MessagingDelegate {
override func application(
_ application: UIApplication,
didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
) -> Bool {
FirebaseApp.configure()
 if #available(iOS 10.0, *) {
  UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
}
GeneratedPluginRegistrant.register(with: self)
Messaging.messaging().delegate = self
if #available(iOS 10.0, *) {
// For iOS 10 display notification (sent via APNS)
UNUserNotificationCenter.current().delegate = self
let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
UNUserNotificationCenter.current().requestAuthorization(
options: authOptions,
completionHandler: {_, _ in })
}
application.registerForRemoteNotifications()
return super.application(application, didFinishLaunchingWithOptions: launchOptions)
}
}
*/
//todo:for setstate time mounted error
/*
@override
void setState(VoidCallback fn) {
  if (mounted) {
    super.setState(fn);
  }
}
*/

//todo:scroller controller time error use this
//if(!controller.hasClients)return;
// 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
