import 'package:flutter/material.dart';
import 'package:sing_in_page/Screen/View/Sign_up.dart';
import 'package:sing_in_page/Screen/View/Sing_in.dart';
import 'package:sing_in_page/Screen/View/home_screen.dart';
import 'package:sing_in_page/Screen/View/splace_screen.dart';


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => SplaceScreen(),
        'signin':(context) => SignInScreen(),
        'signup':(context) => SignUpScreen(),
        'home':(context) => HomeScreen(),
      },
    ),
  );
}
