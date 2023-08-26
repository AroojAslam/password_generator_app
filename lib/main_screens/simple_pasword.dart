import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/foundation.dart';

import '../constants.dart';
import 'home_screen.dart';


class SimplePassword extends StatefulWidget {

  SimplePassword({Key? key}) : super(key: key);

  @override
  State<SimplePassword> createState() => _SimplePasswordState();
}
class _SimplePasswordState extends State<SimplePassword> {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance.collection('users');
  String a="";
  var str;
  var num;
  int count=1;
  String pasword=" ";
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

  String generatenumber(int len) {
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
          title: Text('Generate Simple Password ' ,style: TextStyle(color: Colors.white),),
          leading: IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(),));
            },
            icon: Icon(Icons.keyboard_backspace_rounded,color: Colors.white),
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
                    SizedBox(height: 30,),
                    Text("$pasword ",style: TextStyle(fontSize: 35,color: Colors.black87),),
                    Divider(thickness: 1,height: 1,color: Colors.grey.shade700,indent: 80,endIndent: 80,),

                  ],
                )
            ),
            mainContainer(
              context: context,
              column:Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 25,),
                customGestureDetector(buttonText:'App Name', onTap: (){
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: Colors.white,
                          title: Text('App Name',style: TextStyle(color: Colors.black87),),
                          content: TextField(
                             maxLength: 20,
                            style: TextStyle(color: Colors.black),
                            onChanged: (value) {
                              setState(() {
                                a =  (value);
                              });
                            },
                            decoration: InputDecoration(hintText: "Enter App Name",hintStyle:TextStyle(color:Colors.black54)),
                          ),
                          actions: <Widget>[
                            ElevatedButton(
                              child: Text("ok"),
                              onPressed: () {
                                setState(() {
                                  Navigator.pop(context);
                                });
                              },),
                            ElevatedButton(
                              child: Text("cancle"),
                              onPressed: () {
                                setState(() {
                                  Navigator.pop(context);
                                  a='';
                                });
                              },),

                          ],
                        );
                      });
                },
                  context: context, ),
                customGestureDetector(buttonText: 'Generate Password',  onTap: (){
                  setState(() {
                   if(a!=''){
                     str=generateRandomString(4);
                     num=generatenumber(4);
                     pasword=str+num;
                   }else
                 {
                   Utils().toastmessage('For Generating Password you enter app name');

                 }
                  });

                }, context: context),
                customGestureDetector(buttonText: 'Save Password', onTap: (){
                  addpasswor(pasword: '$pasword',a: '$a');
                  Utils().toastmessage('Password Saved');
                  setState(() {
                    pasword='';
                    a='';
                  });
                }, context: context),
                SizedBox(height: 25,),

              ],
            ), ),
          ],
        ),
      ),
    );
  }
}
