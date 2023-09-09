import 'package:flutter/material.dart';
import 'package:flutter_application_1/hidden_drawer.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:path_provider/path_provider.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  await Hive.openBox('weatherBox'); // ایجاد باکس برای ذخیره اطلاعات آب و هوا
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatelessWidget {
  final Constants _constants = Constants();

  SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Lottie.asset('assets/splash_screen3.json'),
      backgroundColor: _constants.primaryColor,
      nextScreen: HiddenDrawer(),
      splashIconSize: 150,
      duration: 2000,
      pageTransitionType: PageTransitionType.fade,
      animationDuration: const Duration(seconds: 1),
    );
  }
}
