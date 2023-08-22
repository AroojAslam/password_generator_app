import 'package:flutter/material.dart';
import 'package:password_generator_app/auth/signup.dart';
import 'package:password_generator_app/constants.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool showpasword =true;

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
                      child: Column(

                    children: [
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
                      child: TextButton(onPressed: (){}, child: Text('Forget Password',))),
                  SizedBox(height: 10,),
                  customGestureDetector(buttonText: 'LogIn', onTap: (){}, context: context,height: 50),
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
