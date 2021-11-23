// @dart=2.9
import 'package:flutter/material.dart';
import 'package:ecommerece_velocity_app/routes.dart';
import 'package:ecommerece_velocity_app/screens/profile/profile_screen.dart';
import 'package:ecommerece_velocity_app/screens/splash/splash_screen.dart';
import 'package:ecommerece_velocity_app/theme.dart';
import 'package:flutter/services.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

Future<void> main() async {
  await Settings.init(cacheProvider: SharePreferenceCache());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),

      // home: SplashScreen(),
      // We use routeName so that we dont need to remember the name
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
