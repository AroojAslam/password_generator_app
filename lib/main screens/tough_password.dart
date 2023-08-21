import 'dart:math';

import 'package:flutter/material.dart';

import '../constants.dart';
import 'home_screen.dart';

class ToughPassword extends StatefulWidget {
  const ToughPassword({Key? key}) : super(key: key);

  @override
  State<ToughPassword> createState() => _ToughPasswordState();
}

class _ToughPasswordState extends State<ToughPassword> {
  int charater=0;
  int digit=0;
  int sym=0;
  var str;
  var num;
  var sym1;
  int lengh=0;
  String a=" ";
  var pasword=" ";
  String generateRandomString(int len) {
    final _random = Random();
    const _availableLetr =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz';
    final randomString = List.generate(len,
          (index) => _availableLetr[_random.nextInt(_availableLetr.length)],
    )
        .join();

    return randomString;
  }
  String generatenumber(int len) {
    final _random = Random();
    const _availableNum =
        '0123456789';
    final randomString = List.generate(len,
          (index) => _availableNum[_random.nextInt(_availableNum.length)],
    )
        .join();
    return randomString;
  }
  String generateRandomSymbol(int len) {
    final _random = Random();
    const _availableLetr =
        '@#!|\ ^&*?/+_%';
    final randomString = List.generate(len,
          (index) => _availableLetr[_random.nextInt(_availableLetr.length)],
    )
        .join();

    return randomString;
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade700,
        title: Text('Create Tough Password',style: TextStyle(color: Colors.white),),
          leading: IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(),));
            },
            icon: Icon(Icons.keyboard_backspace_rounded,color: Colors.white),
          )

      ),
      body:  Column(
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
                customGestureDetector(context: context,onTap: (){
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: Colors.white,
                          title: Text('Enter Title',style: TextStyle(color: Colors.black87),),
                          content: TextField(
                            style: TextStyle(color: Colors.black),
                            onChanged: (value) {
                              setState(() {
                                a =  (value);
                              });
                            },
                            decoration: InputDecoration(hintText: "Generate Password For...",hintStyle:TextStyle(color:Colors.black54)),
                          ),
                          actions: <Widget>[
                            ElevatedButton(

                              child: Text("ok"),
                              onPressed: () {
                                setState(() {
                                  Navigator.pop(context);
                                });
                              },
                            ),

                          ],
                        );
                      });
                },buttonText: 'Generate Password For',height: 55),
                customGestureDetector(context: context, onTap: (){
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: Colors.white,
                          title: Text('Enter Lenght',style: TextStyle(color: Colors.black87),),
                          content: Container(
                            height: 200,
                            child: Column(
                              children: [
                                TextField(
                                  style: TextStyle(color: Colors.black),
                                  onChanged: (value) {
                                    setState(() {
                                      lengh =  int.parse(value);
                                    });
                                  },
                                  decoration: InputDecoration(hintText: "Total Length",hintStyle:TextStyle(color:Colors.black54)),
                                ),
                                TextField(
                                  style: TextStyle(color: Colors.black),
                                  onChanged: (value) {
                                    setState(() {
                                      charater =  int.parse(value);

                                    });
                                  },
                                  decoration: InputDecoration(hintText: "Total Characters",hintStyle:TextStyle(color:Colors.black54)),
                                ),
                                TextField(
                                  style: TextStyle(color: Colors.black),
                                  onChanged: (value) {
                                    setState(() {
                                      digit =  int.parse(value);
                                    });
                                  },
                                  decoration: InputDecoration(hintText: "Total Digits",hintStyle:TextStyle(color:Colors.black54)),
                                ),
                                TextField(
                                  style: TextStyle(color: Colors.black),
                                  onChanged: (value) {
                                    setState(() {
                                      sym =  int.parse(value);
                                    });
                                  },
                                  decoration: InputDecoration(hintText: "Total Symbols",hintStyle:TextStyle(color:Colors.black54)),
                                ),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            ElevatedButton(

                              child: Text("ok"),
                              onPressed: () {
                                setState(() {
                                  lengh=lengh-charater;
                                  lengh=lengh-digit;
                                  lengh=lengh-sym;
                                  Navigator.pop(context);
                                });
                              },
                            ),

                          ],
                        );
                      });
                  generatenumber(charater);
                  generatenumber(digit);
                  generatenumber(sym);
                },buttonText: 'Total Length',height: 55),
                customGestureDetector(buttonText: 'generate password', onTap: (){
                  if((charater==0 && digit==0) && (sym==0 && lengh==0)){
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text("Error",textAlign: TextAlign.center),
                        content: Text("Enter total length to generate password",textAlign: TextAlign.center),
                        actions: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                            child: Text("Ok"),
                          ),
                        ],
                      ),
                    );
                  }
                  if(lengh<0){
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text("Error",textAlign: TextAlign.center),
                        content: Text("Your given Length is greater then total length",textAlign: TextAlign.center),
                        actions: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                            child: Text("Ok"),
                          ),
                        ],
                      ),
                    );
                  }
                  else if(lengh==0){
                    setState(() {
                      str = generateRandomString(charater);
                      num =  generatenumber(digit);
                      sym1 = generateRandomSymbol(sym);
                      pasword=str+num+sym1;
                    });
                  }
                  else {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text("Error",textAlign: TextAlign.center),
                        content: Text("Your given Length is smaller then total length",textAlign: TextAlign.center),
                        actions: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                            child: Text("Ok"),
                          ),
                        ],
                      ),
                    );

                  }
                }, context: context,height: 55),
                customGestureDetector(buttonText: "Save Password", onTap: (){
                  // FirebaseFirestore.instance.collection("PasswordGenerater").add({'Hint':'$a','Password':'$pasword'});

                }, context: context,height: 55),

                SizedBox(height: 25,),

              ],
            ),
          )
        ],
      ),
    );
  }
}