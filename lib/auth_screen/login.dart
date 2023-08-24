import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:password_generator_app/auth_screen/forgot_password.dart';
import 'package:password_generator_app/auth_screen/signup.dart';
import 'package:password_generator_app/constants.dart';

import '../main_screens/home_screen.dart';
class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool loading=false;
  GlobalKey<FormState> formKey=GlobalKey<FormState>();
  bool showpasword =true;
final auth = FirebaseAuth.instance;
  final emailController =TextEditingController();
  final passwordController =TextEditingController();
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
                  Image(
                      width: 200,
                      height: 200,
                      image: AssetImage('assets/images/main.png')),
                  Text(
                    'LogIn',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Welcome to Password generator ',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade600),
                  ),
                  Form(
                   key:formKey,
                      child: Column(

                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          decoration: InputDecoration(
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
                          obscureText: showpasword,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.password),
                              suffixIcon: showpasword?IconButton(
                                onPressed: (){
                                  setState(() {
                                    showpasword =!showpasword;
                                  });
                                },
                                icon: Icon(Icons.visibility_off_outlined)
                              ):IconButton(
                                  onPressed: (){
                                    setState(() {
                                      showpasword =!showpasword;
                                    });
                                  },
                                  icon: Icon(Icons.visibility_outlined)
                              ),
                              hintText: 'Password'

                          ),
                        ),
                      )
                    ],
                  )
                  ),
                  Align(
                    alignment: Alignment.topRight,
                      child: TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ForgorPassword(),));
                      }, child: Text('Forget Password',))),
                  SizedBox(height: 10,),
                  customGestureDetector(buttonText: 'LogIn',loading: loading ,onTap: (){
                  if(formKey.currentState!.validate()){
                    setState(() {
                      loading=true;
                    });
                    auth.signInWithEmailAndPassword(
                        email: emailController.text.toString(),
                        password: passwordController.text.toString()).then((value) => {
                          Utils().toastmessage(value.user!.email.toString()),
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(),)),
                    setState(() {
                    loading=false;
                    }),
                    }).onError((error, stackTrace) => {
                      Utils().toastmessage(error.toString()),
                    setState(() {
                    loading=false;
                    }),
                    });
                  }
                  }, context: context,height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t Have an Account'),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp(),));
                      }, child: Text('SignUp')),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
