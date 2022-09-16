import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wave_clone/app/constants/colors.dart';

import 'app/routes/app_pages.dart';

late bool isConnected;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  final prefs = await SharedPreferences.getInstance();
  isConnected = prefs.getBool('isConnected') ?? false;
  runApp(
    GetMaterialApp(
      title: "Wave clone",
      debugShowCheckedModeBanner: false,
      initialRoute:
          isConnected ? Routes.HOME : Routes.ONBOARDING,
      // initialRoute: Routes.TEST,
      getPages: AppPages.routes,
      themeMode: ThemeMode.light,
      theme:
          ThemeData.light().copyWith(primaryColor: ConstantValue.primarycolor),
    ),
  );
}
