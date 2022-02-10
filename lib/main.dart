
import 'package:firebase_user_login/LoginScreen.dart';
import 'package:flutter/material.dart';

import 'RegistrationScreen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'home.dart';

  
 void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
  class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: 'Material App',
        home: RegistrationScreen(),
        routes: {
          "/signup":(context)=>RegistrationScreen(),
          "/login":(context)=>LoginScreen(),
          "/home":(context)=>home(),
        
        },
        );
        
        }
  }