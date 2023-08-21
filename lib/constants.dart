
import 'package:flutter/material.dart';

Widget homeButton(String title,String subtitle,BuildContext context,VoidCallback ontap){
  return GestureDetector(
    onTap: ontap,
    child: Card(
      color: Colors.grey.shade50,
        margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Adjust the value as needed
        ),
        child: SizedBox(
          height: 80,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title, style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500)),
                Divider(indent: 50,endIndent: 50),
                Text(subtitle, style: TextStyle(fontSize: 12,color: Colors.grey.shade600)),
              ],
            ),
          ),
        ),
    ),
  );

}
Widget customGestureDetector(
    {required String buttonText,
      required VoidCallback onTap,required BuildContext context, double height=80}) {
  return GestureDetector(
    onTap: onTap,
    child: Card(
      color: Colors.grey.shade50,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: SizedBox(
        height: height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(buttonText, style: TextStyle(color: Colors.black,fontSize:18,fontWeight: FontWeight.w500 )),
            ],
          ),
        ),
      ),
    ),
  );
}

