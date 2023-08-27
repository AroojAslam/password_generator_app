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
  final appnameController = TextEditingController();
  int charater=0;
  int digit=0;
  int sym=0;
  var str;
  var num;
  var sym1;
  int lengh=0;
  int totalLength=0;
  String appname="";
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
        title:const Text('Create Tough Password',style: TextStyle(color: Colors.white),),
          leading: IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(),));
            },
            icon:const Icon(Icons.keyboard_backspace_rounded,color: Colors.white),
          )

      ),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 30,),
                  Text("$pasword ",style:const TextStyle(fontSize: 35,color: Colors.black87),),
                  Divider(thickness: 1,height: 1,color: Colors.grey.shade700,indent: 80,endIndent: 80,),
                ],
              )
          ),
          mainContainer(
            context: context,
            column: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const  SizedBox(height: 25,),
              customGestureDetector(context: context,onTap: (){
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
              },buttonText: 'Generate Password For',height: 45),
              customGestureDetector(context: context, onTap: (){
                showSuccessDialog(context: context,
                  heading: 'Enter Length',
                  onPressed: (){
                    setState(() {
                      lengh=lengh-charater;
                      lengh=lengh-digit;
                      lengh=lengh-sym;
                      Navigator.pop(context);
                    });
                  }, buttontext: 'Ok',
                  content: SizedBox(
                  height: 250,
                  child: Column(
                    children: [
                      TextField(
                        style:const TextStyle(color: Colors.black),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          setState(() {
                            lengh =  int.parse(value);
                            totalLength=lengh;
                          });
                        },
                        decoration:const InputDecoration(hintText: "Total Length (0-15)",hintStyle:TextStyle(color:Colors.black54)),
                      ),
                      TextField(
                        keyboardType: TextInputType.number,
                        style:const TextStyle(color: Colors.black),
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
                        decoration:const InputDecoration(hintText: "Digits",hintStyle:TextStyle(color:Colors.black54)),
                      ),
                      TextField(
                        keyboardType: TextInputType.number,
                        style:const TextStyle(color: Colors.black),
                        onChanged: (value) {
                          setState(() {
                            sym =  int.parse(value);
                          });
                        },
                        decoration:const InputDecoration(hintText: "Symbols",hintStyle:TextStyle(color:Colors.black54)),
                      ),
                    ],
                  ),
                ),);
                generatenumber(charater);
                generatenumber(digit);
                generatenumber(sym);
              },buttonText: 'Total Length',height: 45),
              customGestureDetector(buttonText: 'generate password', onTap: (){
                if(appname==""){
                  Utils().toastmessage('For Generating Password you enter app name');
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
                if(appname!=''&& pasword!=''){
                  addpasswor(pasword: '$pasword',a: '$appname');
                  Utils().toastmessage('Password Saved');
                }else{
                  Utils().toastmessage('Enter app name and generate password to save password');
                }
                setState(() {
                  pasword='';
                  appname='';
                });
              }, context: context,height: 45),

              const  SizedBox(height: 25,),

            ],
          ),),
        ],
      ),
    );
  }

}