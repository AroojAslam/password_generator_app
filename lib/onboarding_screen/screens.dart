
import 'package:flutter/material.dart';

Widget introScreens({required BuildContext context, required String image ,required String title,required String subtitle}){
  return  Column(
      children: [
        SizedBox(height: 60),
        Image(
          height: MediaQuery.of(context).size.height *.60,
            width: MediaQuery.of(context).size.width*0.9 ,
            image: AssetImage(image)),

        Text(title,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
        Text(subtitle,style: TextStyle(
            fontSize: 15, color: Colors.grey.shade600),textAlign: TextAlign.center,)
      ],
    );
}
