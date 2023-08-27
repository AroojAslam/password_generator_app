import 'package:flutter/material.dart';
import 'package:password_generator_app/auth_screen/login.dart';
import 'package:password_generator_app/constants.dart';
import 'package:password_generator_app/onboarding_screen/screens.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {

  PageController pageController= PageController();
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              left: -100,top: -100,
                child: Container(
                  height: 350,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                )
            ),
            const  Align(
              alignment: Alignment(0,-0.80),
              child:  Text('Welcome to \nPassword Generator',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),textAlign: TextAlign.center),),
            Positioned(
                right: -100,bottom: -100,
                child: Container(
                  height: 350,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                )),
            PageView(
              controller: pageController,
              children: [

                 SizedBox(
                   height: MediaQuery.of(context).size.height,
                   width: MediaQuery.of(context).size.width,
                   child:introScreens(context:context,
                           image: 'assets/images/s1.png',
                           title: 'Generate passwords',
                           subtitle:'Generate simple as well as complex passwords \nfor your apps.' ),

                 ),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child:introScreens(context:context,
                      image: 'assets/images/s2.png',
                      title: 'Save Passwords',
                      subtitle:'Save all your passwords so you don\'t need to remember them again and again.' ),

                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child:introScreens(context:context,
                      image: 'assets/images/s3.png',
                      title: 'Edit Passwords',
                      subtitle:'You can also view or edit your passwords.'),

                ),
              ],
            ),
           Align(
             alignment:const Alignment(0,0.95),
               child: SmoothPageIndicator(
                 controller: pageController,
                 count: 3,
                 effect: ScrollingDotsEffect(
                   dotHeight: 5,
                   dotWidth: 15,
                  activeDotColor:Theme.of(context).primaryColor ,
                  dotColor: Theme.of(context).primaryColor.withOpacity(0.1),
                 ),
               )),
            Align(
              alignment:const Alignment(0,0.85),
              child: customGestureDetector(buttonText: 'Start', onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder:(context) =>const LogIn(),));
                  }, context: context,height: 50),
            ),

          ],
        )
      ),
    );
  }
}
