import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import '../constants.dart';
import 'home_screen.dart';


class SimplePassword extends StatefulWidget {

  const SimplePassword({Key? key}) : super(key: key);

  @override
  State<SimplePassword> createState() => _SimplePasswordState();
}
class _SimplePasswordState extends State<SimplePassword> {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance.collection('users');
  final appnameController = TextEditingController();
  String appname="";
  var str;
  var num;
  int count=1;
  String pasword="";
  String generateRandomString(int len) {
    var str;
    final _random = Random();
    const _availableLetr =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz';
    final randomString = List.generate(len,
          (index) => _availableLetr[_random.nextInt(_availableLetr.length)],
    )
        .join();
    str=randomString;
    return str;
  }

  String generaterandomnumber(int len) {
    var num1;
    final _random = Random();
    const _availableNum =
        '0123456789';
    final randomString = List.generate(len,
          (index) => _availableNum[_random.nextInt(_availableNum.length)],
    )
        .join();
    num1=randomString;
    return num1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title:const Text('Generate Simple Password ' ,style: TextStyle(color: Colors.white),),
          leading: IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>const MyHomePage(),));
            },
            icon:const Icon(Icons.keyboard_backspace_rounded,color: Colors.white),
          )
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const  SizedBox(height: 30,),
                    Text("$pasword ",style:const TextStyle(fontSize: 35,color: Colors.black87),),
                    Divider(thickness: 1,height: 1,color: Colors.grey.shade700,indent: 80,endIndent: 80,),

                  ],
                )
            ),
            mainContainer(
              context: context,
              column:Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const  SizedBox(height: 25,),
                customGestureDetector(buttonText:'App Name', onTap: (){
                  showSuccessDialog(context: context, heading: 'App Name', onPressed: (){
                    appname = appnameController.text.toString();
                    Navigator.pop(context);
                    appnameController.clear();
                  }, buttontext: "Ok",
                    content: Form(
                    child: TextFormField(
                      maxLength: 25,
                      decoration:const InputDecoration(
                        hintText: 'Enter App name'
                      ),
                      controller: appnameController,
                    ),
                  ),);

                },
                  context: context, ),
                customGestureDetector(buttonText: 'Generate Password',  onTap: (){
                  setState(() {
                   if(appname!=''){
                     str=generateRandomString(4);
                     num=generaterandomnumber(4);
                     pasword=str+num;
                   }else
                 {
                   Utils().toastmessage('For Generating Password you enter app name');
                 }
                  });

                }, context: context),
                customGestureDetector(buttonText: 'Save Password', onTap: (){
                  if(pasword !=''){
                    addpasswor(pasword: '$pasword',a: '$appname');
                    Utils().toastmessage('Password Saved');
                  }else{
                    Utils().toastmessage('Enter app name and generate password to save password');
                  }
                  setState(() {
                    pasword='';
                    appname='';
                  });
                }, context: context),
                const SizedBox(height: 25,),

              ],
            ), ),
          ],
        ),
      ),
    );
  }
}
