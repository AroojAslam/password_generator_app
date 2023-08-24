
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:password_generator_app/constants.dart';

import 'login.dart';

class ForgorPassword extends StatefulWidget {
  const ForgorPassword({super.key});

  @override
  State<ForgorPassword> createState() => _ForgorPasswordState();
}

class _ForgorPasswordState extends State<ForgorPassword> {
  final auth= FirebaseAuth.instance;
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text('Forgot Password',style: TextStyle(color: Colors.white),),
          leading: IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => LogIn(),));
            },
            icon: Icon(Icons.keyboard_backspace_rounded,color: Colors.white),
          )

      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  hintText: 'Enter Email',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Email';
                  }
                  if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(value)) {
                    return 'Enter a valid email address';
                  }
                  return null; // Validation passed
                },
              ),
              SizedBox(height: 50,),
              customGestureDetector(buttonText: "Forgot Password", onTap: (){
                auth.sendPasswordResetEmail(email: emailController.text.toString()).then((value){
                  Utils().toastmessage('We have send you email to recover password\ncheck eamil');
                }).onError((error,stackTrace){
                  Utils().toastmessage(error.toString());
                });
              }, context: context,height: 50)
            ],
          ),
        ),
      ),
    );
  }
}
