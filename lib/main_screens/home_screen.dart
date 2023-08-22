import 'package:flutter/material.dart';
import 'package:password_generator_app/constants.dart';
import 'package:password_generator_app/main_screens/simple_pasword.dart';
import 'package:password_generator_app/main_screens/tough_password.dart';
import 'package:password_generator_app/main_screens/view_password.dart';

import '../auth_screen/login.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'Password Generator',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> LogIn()));
            },
           icon:   Icon(Icons.logout,color:Colors.white),)
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Image(
                        width: 200,
                        height: 200,
                        image: AssetImage('assets/images/main.png')),
                    Text(
                      'Lets Generator your Password',
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 1),
                    Text(
                      'Enhancing app security through tough password ',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade600),
                    ),
                  ],
                ),
              ),
              mainContainer(context: context, column: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  customGestureDetector(
                    buttonText: "Generate Simple Password",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SimplePassword(),
                          ));
                    },
                    context: context,
                    text: Text("Eight Length Password", style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
                  ),
                  customGestureDetector(
                    buttonText: "Generate Tough Password",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ToughPassword(),
                          ));
                    },
                    context: context,
                    text: Text("Customize Password",
                        style: TextStyle(
                            fontSize: 12, color: Colors.grey.shade600)),
                  ),
                  customGestureDetector(
                    buttonText: "View All Password",
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ViewPassword(),));
                    },
                    context: context,
                    text: Text("View,Edit & Delete Password",
                        style: TextStyle(
                            fontSize: 12, color: Colors.grey.shade600)),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
