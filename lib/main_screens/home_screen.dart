import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:password_generator_app/constants.dart';
import 'package:password_generator_app/main_screens/simple_pasword.dart';
import 'package:password_generator_app/main_screens/tough_password.dart';
import 'package:password_generator_app/main_screens/view_password.dart';
import '../auth_screen/login.dart';

class  MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
       SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).primaryColor,
          title:const Text(
            'Password Generator',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
              onPressed: (){
                setState(() {
                  showSuccessDialog(context: context,
                      heading: 'Are You Sure !\nyou want to LogOut',
                      buttontext: 'yes',onPressed: (){
                        auth.signOut().then((value) => {
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>const LogIn(),))
                        });
                  });
                });

              },
             icon: const  Icon(Icons.logout,color:Colors.white),)
          ],
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 30,),
                        const  Image(
                            width: 200,
                            height: 200,
                            image: AssetImage('assets/images/main.png')),
                        const  Text(
                          'Password Generator',
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        const  SizedBox(height: 1),
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
                ),
                mainContainer(context: context,
                  column: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const  SizedBox(
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
                    const  SizedBox(
                      height: 25,
                    ),
                  ],
                ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
