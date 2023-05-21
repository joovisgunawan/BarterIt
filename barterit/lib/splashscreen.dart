import 'dart:convert';

import 'package:barterit/mainscreens/landingscreen.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'getstarted.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../phpconfig.dart';
import '../userobject/user.dart';
import 'package:http/http.dart' as http;

// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:flutter_splash_screen/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashIconSize: 150,
      duration: 4000,
      splash: Image.asset('assets/images/logo.png'),
      nextScreen: const GetStarted(),
      splashTransition: SplashTransition.fadeTransition,
      // pageTransitionType: PageTransitionType.scale,
      backgroundColor: const Color(0xff000022),
    );
  }

  checkAndLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = (prefs.getString('email')) ?? '';
    String password = (prefs.getString('pass')) ?? '';
    bool ischeck = (prefs.getBool('checkbox')) ?? false;
    late User user;
    if (ischeck) {
      http.post(
        Uri.parse("${PhpConfig().SERVER}/barterit/php/signin.php"),
        body: {
          "email": email,
          "password": password,
        },
      ).then(
        (response) {
          if (response.statusCode == 200) {
            var jsondata = jsonDecode(response.body);
            user = User.fromJson(jsondata['data']);
          } else {
            user = User(
              id: "na",
              name: "na",
              email: "na",
              password: "na",
            );
          }
        },
      );
    } else {
      user = User(
        id: "na",
        name: "na",
        email: "na",
        password: "na",
      );
    }
  }
}
