import 'dart:async';
import 'dart:ui';
import 'package:delete_all_widget_demo/app/common/localization/localization_screen.dart';
import 'package:delete_all_widget_demo/app/database/hive/model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'app/all_show_widget/common_widget.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:delete_all_widget_demo/app/common/notification.dart';

import 'app/common/localization/localizations.dart';

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
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  //flutter_crashlytics
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
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
    return ChangeNotifierProvider(
      create: (context) => HomeLocalController(),
      builder: (context, child) => MaterialApp(
        locale: context.watch<HomeLocalController>().locale,
        localeResolutionCallback: (deviceLocale, supportedLocales) {
          for (var locale in supportedLocales) {
            if (locale.languageCode == deviceLocale!.languageCode &&
                locale.countryCode == deviceLocale.countryCode) {
              return deviceLocale;
            }
          }
          return supportedLocales.first;
        },
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          AppLocalization.delegate,
        ],
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('hi', 'IN'),
        ],
        home: CommonWidget(),
      ),
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
///gitlab for practise...

//todo :git command
/*
git init
git add .
git commit -m "commit message"
git branch -M main/master
git remote add origin link...
git push -u origin main/master

git remote -v
git remote remove origin
git branch newname..
git checkout -b newname.. //create the new branch and that branch are open
git checkout branchname...
git branch -D branchname..

git status
git log
git log --all --graph
git log --all

git reset .

git config --global user.name "name.."
git config --global user.email "email.."
git config --global user.name
git config --global user.email

//todo:creat the new branch push the github
git add .
git commit -m " sdf"
git push -u origin branchname
//then pull request create and seniour developer merge and cancel the pull requiest.
if pullrequirest merge in main then get code in local write
//git pull origin main

//git diff main
//git merge main

*/
