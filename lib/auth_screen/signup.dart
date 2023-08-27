import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:password_generator_app/constants.dart';

import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool loading=false;
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance.collection('users');
  late UserCredential authResult;
  GlobalKey<FormState> formKey=GlobalKey<FormState>();
  final emailController =TextEditingController();
  final nameController =TextEditingController();
  final passwordController =TextEditingController();
  final confirmpasswordController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const   Image(
                      width: 200,
                      height: 200,
                      image: AssetImage('assets/images/main.png')),
                  const   Text(
                    'SignUp',
                    style:const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const  SizedBox(height: 5),
                  Text(
                    'Welcome to Password generator ',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade600),
                  ),
                  Form(
                    key: formKey,
                      child: Column(

                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: TextFormField(
                              controller: nameController,
                              decoration:const InputDecoration(
                                  prefixIcon: Icon(Icons.person_outline_rounded),
                                  hintText: 'Name'
                              ),
                              validator: (value) {
                                if(value!.isEmpty){
                                  return 'Enter Name';
                                }
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: emailController,
                              decoration:const InputDecoration(
                                prefixIcon: Icon(Icons.email_outlined),
                                hintText: 'Email',
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
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: TextFormField(
                              controller: passwordController,
                              obscureText: true,
                              decoration:const InputDecoration(
                                  prefixIcon: Icon(Icons.password),
                                  hintText: 'Password'
                              ),
                              validator: (value) {
                                if(value!.isEmpty){
                                  return 'Enter Password';
                                }
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: TextFormField(
                              controller: confirmpasswordController,
                              obscureText: true,
                              decoration:const InputDecoration(
                                  prefixIcon: Icon(Icons.password),
                                  hintText: 'Confirm Password'
                              ),
                              validator: (value) {
                                if(value!.isEmpty){
                                  return 'Enter Password';
                                }
                              },
                            ),
                          )
                        ],
                      )
                  ),
                  const   SizedBox(height: 30,),
                  customGestureDetector(buttonText: 'SignUp', onTap: (){
                    if(formKey.currentState!.validate()){
                      setState(() {
                        loading=true;
                      });
                      if(passwordController.text.toString() == confirmpasswordController.text.toString()){
                        auth.createUserWithEmailAndPassword(
                            email: emailController.text,
                            password:passwordController.text).then((value) => {
                          Utils().toastmessage('Successfully SignIn'),
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>const LogIn(),)),
                        setState(() {
                        loading=false;
                        }),
                        }).onError((error, stackTrace) => {
                          Utils().toastmessage(error.toString()),
                        setState(() {
                        loading=false;
                        }),
                        });
                      }else{
                        setState(() {
                          loading=false;
                        });
                        Utils().toastmessage('Password is not same');
                      }
                    }
                  }, context: context,height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already Have an Account'),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>const LogIn(),));
                      }, child:const Text('LogIn')),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
