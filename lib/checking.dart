
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'main_screens/home_screen.dart';
import 'onboarding_screen/intro_screens.dart';

class checking extends StatefulWidget {
  const checking({super.key});

  @override
  State<checking> createState() => _checkingState();
}

class _checkingState extends State<checking> {
  void isLogIn(){
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if(user != null){
      Timer(Duration(seconds: 3),() {
        Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(),));
      },);
    }else{
      Timer(Duration(seconds: 3),() {
        Navigator.push(context, MaterialPageRoute(builder: (context) => OnboardScreen(),));
      },);
    }
  }
  @override
  void initState() {
    super.initState();
    isLogIn();
  }
  Widget build(BuildContext context) {
    return Scaffold(
    body: Align(
      alignment: Alignment(0,0),
      child: CircularProgressIndicator() ,)
    );
  }
}
