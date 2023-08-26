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
  int totalLength=0;
  String a="";
  var pasword="";
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
          backgroundColor: Theme.of(context).primaryColor,
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
          mainContainer(
            context: context,
            column: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 25,),
              customGestureDetector(context: context,onTap: (){
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        title: Text('App Name',style: TextStyle(color: Colors.black87),),
                        content: TextField(
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
                            },
                          ),

                        ],
                      );
                    });
              },buttonText: 'Generate Password For',height: 45),
              customGestureDetector(context: context, onTap: (){
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        title: Text('Enter Lenght',style: TextStyle(color: Colors.black87),),
                        content: Container(
                          height: 250,
                          child: Column(
                            children: [
                              TextField(
                                style: TextStyle(color: Colors.black),
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  setState(() {
                                    lengh =  int.parse(value);
                                    totalLength=lengh;
                                  });
                                },
                                decoration: InputDecoration(hintText: "Total Length (0-15)",hintStyle:TextStyle(color:Colors.black54)),
                              ),
                              TextField(
                                keyboardType: TextInputType.number,
                                style: TextStyle(color: Colors.black),
                                onChanged: (value) {
                                  setState(() {
                                    charater =  int.parse(value);

                                  });
                                },
                                decoration: InputDecoration(hintText: "Characters",hintStyle:TextStyle(color:Colors.black54)),
                              ),
                              TextField(
                                keyboardType: TextInputType.number,
                                style: TextStyle(color: Colors.black),
                                onChanged: (value) {
                                  setState(() {
                                    digit =  int.parse(value);
                                  });
                                },
                                decoration: InputDecoration(hintText: "Digits",hintStyle:TextStyle(color:Colors.black54)),
                              ),
                              TextField(
                                keyboardType: TextInputType.number,
                                style: TextStyle(color: Colors.black),
                                onChanged: (value) {
                                  setState(() {
                                    sym =  int.parse(value);
                                  });
                                },
                                decoration: InputDecoration(hintText: "Symbols",hintStyle:TextStyle(color:Colors.black54)),
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
              },buttonText: 'Total Length',height: 45),
              customGestureDetector(buttonText: 'generate password', onTap: (){
                if(a==""){
                  Utils().toastmessage('For Generating Password\nyou enter app name');
                }
             else   if(totalLength>15 ){
                 Utils().toastmessage("Total length is greater then 15");
                }
              else  if((charater==0 && digit==0) && (sym==0 && lengh==0)){
                Utils().toastmessage("Enter total length to generate password");
                }
               else if(lengh<0){
                 Utils().toastmessage("Your given Length is greater then total length");
                }
                else if(lengh==0 && totalLength<=15){
                  setState(() {
                    str = generateRandomString(charater);
                    num =  generatenumber(digit);
                    sym1 = generateRandomSymbol(sym);
                    pasword=str+num+sym1;
                  });
                }
                else {
                  Utils().toastmessage("Your given Length is smaller then total length");

                }
              }, context: context,height: 45),
              customGestureDetector(buttonText: "Save Password", onTap: (){
                addpasswor(a: '$a',pasword: '$pasword');
                Utils().toastmessage('Password Saved');
                setState(() {
                  pasword='';
                  a='';
                });
              }, context: context,height: 45),

              SizedBox(height: 25,),

            ],
          ),),
        ],
      ),
    );
  }

}