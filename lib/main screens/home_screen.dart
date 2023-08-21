
import 'package:flutter/material.dart';
import 'package:password_generator_app/constants.dart';
import 'package:password_generator_app/main%20screens/simple_pasword.dart';
import 'package:password_generator_app/main%20screens/tough_password.dart';
import 'package:password_generator_app/main%20screens/view_password.dart';

class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.grey.shade700,
        title: Text('Pocket Password Dairy',style: TextStyle(color: Colors.white),),
        leading: Image(image: AssetImage('assets/images/main.png')),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Column(
               children: [
                 SizedBox(height:MediaQuery.of(context).size.height*0.02,),
                 Image(
                     width: 200,
                     height: 200,
                     image: AssetImage('assets/images/main.png')),

                 Text('Password Generator', style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                 SizedBox(height:3),
                 Text('Enhancing app security through tough password ',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: Colors.grey.shade600),),
               ],
             ),
             Container(
               height: MediaQuery.of(context).size.height*0.47,
               decoration: BoxDecoration(
                 color: Colors.grey.shade700,
                 borderRadius: BorderRadius.only(
                   topRight: Radius.circular(30),
                   topLeft: Radius.circular(30),
                 ),
                 boxShadow: [
                   BoxShadow(
                     color: Colors.black.withOpacity(0.3), // Shadow color
                     spreadRadius: 2, // Spread radius
                     blurRadius: 10, // Blur radius
                     offset: Offset(0, 3), // Offset in the (x, y) direction
                   ),
                 ],
               ),

                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     SizedBox(height: 25,),
                     homeButton("Create Simple Password", "Eight Lenght Password",context,(){
                       Navigator.push(context, MaterialPageRoute(builder: (context) => SimplePassword(),));
                     }),

                     homeButton("Create Tough Password", "Customize Password ",context,(){
                       Navigator.push(context, MaterialPageRoute(builder: (context) => ToughPassword(),));
                     }),
                     homeButton("View All Password", "View,Edit & Delect Password",context,(){
                       Navigator.push(context, MaterialPageRoute(builder: (context) => ViewPassword(),));
                     }),
                     SizedBox(height: 25,),

                   ],
                 ),
             )
            ],
          ),
        ),
      ),
    );
  }
}
