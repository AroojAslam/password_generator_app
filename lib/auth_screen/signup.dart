import 'package:flutter/material.dart';
import 'package:password_generator_app/constants.dart';

import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final emailController =TextEditingController();
  final nameController =TextEditingController();
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
                    'SignUp',
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
                      child: Column(

                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: TextFormField(
                              controller: nameController,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.person_outline_rounded),
                                  hintText: 'Name'

                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.email_outlined),
                                  hintText: 'Email'

                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: TextFormField(
                              controller: passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.password),
                                  hintText: 'Password'

                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: TextFormField(
                              controller: passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.password),
                                  hintText: 'Confirm Password'
                              ),
                            ),
                          )
                        ],
                      )
                  ),
                  SizedBox(height: 30,),
                  customGestureDetector(buttonText: 'SignUp', onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LogIn(),));
                  }, context: context,height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already Have an Account'),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LogIn(),));
                      }, child: Text('SighUp')),
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
