import 'dart:async';
import 'dart:ui';
import 'package:delete_all_widget_demo/app/database/hive/model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
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

//fixme: info.plist
/*

<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
<key>CFBundleDevelopmentRegion</key>
<string>$(DEVELOPMENT_LANGUAGE)</string>
<key>CFBundleExecutable</key>
<string>$(EXECUTABLE_NAME)</string>
<key>CFBundleIdentifier</key>
<string>$(PRODUCT_BUNDLE_IDENTIFIER)</string>
<key>CFBundleInfoDictionaryVersion</key>
<string>6.0</string>
<key>CFBundleName</key>
<string>Ethnic Export</string>
<key>CFBundlePackageType</key>
<string>APPL</string>
<key>CFBundleShortVersionString</key>
<string>$(MARKETING_VERSION)</string>
<key>CFBundleSignature</key>
<string>????</string>
<key>CFBundleURLTypes</key>
<array>
<dict>
<key>CFBundleTypeRole</key>
<string>Editor</string>
<key>CFBundleURLSchemes</key>
<array>
<string>com.developer.ethnicexport</string>
</array>
</dict>
<dict>
<key>CFBundleTypeRole</key>
<string>Editor</string>
<key>CFBundleURLSchemes</key>
<array>
<string>com.googleusercontent.apps.806565206717-0c35ultdsfdsafdnflsdbne2b9hi</string>
</array>
</dict>
<dict>
<key>CFBundleTypeRole</key>
<string>Editor</string>
<key>CFBundleURLSchemes</key>
<array>
<string>fb000000000000</string>
</array>
</dict>
</array>
<key>CFBundleVersion</key>
<string>$(CURRENT_PROJECT_VERSION)</string>
<key>FacebookAppID</key>
<string>000000000000</string>
<key>FacebookDisplayName</key>
<string>YOUR_APP_NAME</string>
<key>GADApplicationIdentifier</key>
<string>ca-app-pub-1336141348317767~4640963371</string>
<key>LSApplicationQueriesSchemes</key>
<array>
<string>fbapi</string>
<string>fb-messenger-share-api</string>
<string>whatsapp</string>
<string>fbauth2</string>
<string>fbshareextension</string>
<string>itms</string>
</array>
<key>LSMinimumSystemVersion</key>
<string>11.0</string>
<key>LSRequiresIPhoneOS</key>
<true/>
<key>MinimumOSVersion</key>
<string>11.0</string>
<key>NSAppTransportSecurity</key>
<dict>
<key>NSAllowsArbitraryLoads</key>
<true/>
<key>NSAllowsArbitraryLoadsInWebContent</key>
<true/>
</dict>
<key>NSAppleMusicUsageDescription</key>
<string>when user get notified that time use</string>
<key>NSCalendarsUsageDescription</key>
<string>purpose for using calendar</string>
<key>NSContactsUsageDescription</key>
<string>user order time get contact number</string>
<key>NSLocationAlwaysAndWhenInUseUsageDescription</key>
<string>user get there location to the best useges</string>
<key>NSLocationAlwaysUsageDescription</key>
<string>Need current location access</string>
<key>NSLocationWhenInUseUsageDescription</key>
<string>Get Your current location for delivery</string>
<key>NSMotionUsageDescription</key>
<string>show the move motion data to display</string>
<key>NSPhotoLibraryAddUsageDescription</key>
<string>$(PRODUCT_NAME)</string>
<key>NSPhotoLibraryUsageDescription</key>
<string>This app requires access to the photo library because user may need to upload images of payment slip and also user can download/save images of the products from the application</string>
<key>NSSpeechRecognitionUsageDescription</key>
<string>user mic to speek add text are write</string>
<key>NSUserTrackingUsageDescription</key>
<string>This identifier will be used to deliver personalized ads to you.</string>
<key>UIBackgroundModes</key>
<array>
<string>fetch</string>
<string>remote-notification</string>
</array>
<key>UILaunchStoryboardName</key>
<string>LaunchScreen</string>
<key>UIMainStoryboardFile</key>
<string>Main</string>
<key>UISupportedInterfaceOrientations</key>
<array>
<string>UIInterfaceOrientationPortrait</string>
</array>
<key>UISupportedInterfaceOrientations~ipad</key>
<array>
<string>UIInterfaceOrientationPortrait</string>
<string>UIInterfaceOrientationPortraitUpsideDown</string>
<string>UIInterfaceOrientationLandscapeLeft</string>
<string>UIInterfaceOrientationLandscapeRight</string>
</array>
<key>UIViewControllerBasedStatusBarAppearance</key>
<false/>
<key>io.flutter.embedded_views_preview</key>
<string>YES</string>
<key>io.flutter.embedded_views_preview</key>
<true/>
<key>FirebaseAppDelegateProxyEnabled</key>
<false/>

</dict>
</plist>
*/

//
