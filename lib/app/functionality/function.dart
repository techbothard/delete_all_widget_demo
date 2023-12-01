import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

class FunctionApp {
  //todo:device_info_plus  package
  Future<void> deviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    final ios = await deviceInfo.iosInfo;
    androidInfo.version;
    androidInfo.device;
    androidInfo.product;
    androidInfo.id;
    androidInfo.model;
    androidInfo.serialNumber;
  }

  //todo:package_info_plus :
  Future<void> packageInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;
  }
}
